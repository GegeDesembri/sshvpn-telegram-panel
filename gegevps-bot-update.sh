#!/bin/bash

# Get Latest Version
get_latest_release() {
	curl -4 --silent "https://api.github.com/repos/$1/releases/latest" | jq -r .tag_name
}

# Parameters
workdir="/etc/gegevps/telegram-bot"
bin_localname="gegevps-bot"
bin_localpath="/usr/local/bin/${bin_localname}"
bin_source="GegeDesembri/sshvpn-telegram-panel"
installed_version="$(${bin_localpath} --version)"
latest_version="$(get_latest_release "${bin_source}")"
bin_filename="gegevps-bot-linux"

if [[ ! "${installed_version}" == "${latest_version}" ]]; then
    # Install Binary
    bin_url="https://github.com/${bin_source}/releases/download/${latest_version}/${bin_filename}"
    systemctl stop gegevps-bot
    if wget -qO "${bin_localpath}" "${bin_url}"; then
        chmod +x "${bin_localpath}"
        echo -e "Binary File Installed"
        systemctl start gegevps-bot
    else
        echo -e "Failed Install Binary"
        exit 1
    fi
else
    echo -e "Version up to date ${latest_version}"
    exit 0
fi


# Install Dependencis
mkdir -p "${workdir}" &>/dev/null
apt-get install -qq -y sshpass

# Install Service
DIR_SYSTEMD="/etc/systemd/system"
systemd_service_url="https://raw.githubusercontent.com/${bin_source}/master/${bin_localname}.service"
if wget -qO ${DIR_SYSTEMD}/${bin_localname}.service "${systemd_service_url}"; then
    chmod +x ${DIR_SYSTEMD}/${bin_localname}.service
    systemctl daemon-reload
    echo -e "SystemD File Installed"
else
    echo -e "Failed Install SystemD"
    exit 1
fi

# Install Payment Validation
payval_local="/usr/local/bin/gegevps-bot-payval"
payval_url="https://github.com/${bin_source}/raw/master/payment_validation.sh"
if wget -qO "${payval_local}" "${payval_url}"; then
    chmod +x "${payval_local}"
    echo -e "Payment Validation File Installed"
else
    echo -e "Failed Install Payment Validation"
    exit 1
fi

# Install Crontab
if [[ $(crontab -l | grep -wce "${payval_local}") -eq 0 ]]; then
	crontab_temp="$(mktemp)"
	crontab -l > ${crontab_temp}
	echo -e "\n*/1 * * * * ${payval_local}" >> ${crontab_temp}
	crontab ${crontab_temp}
	rm -rf ${crontab_temp}
fi

# Initial
if [[ ! -f "${workdir}/.env" ]]; then
	${bin_localname} &>/dev/null
fi

# Helper
echo -e "Kamu bisa mengatur semua konfigurasi pada file"
echo -e "${workdir}/.env"
echo -e ""
echo -e "Kamu bisa menambahkan server pada file JSON"
echo -e "${workdir}/server_list.json"
echo -e ""
echo -e "Kamu bisa mengatur harga Tunnel folder"
echo -e "${workdir}/price"
