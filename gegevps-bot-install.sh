#!/bin/bash

# Get Latest Version
get_latest_release() {
	curl -4 --silent "https://api.github.com/repos/$1/releases/latest" | jq -r .tag_name
}

# Parameters
workdir="/etc/gegevps/telegram-bot"
bin_localname="gegevps-bot"
bin_source="GegeDesembri/sshvpn-telegram-panel"
latest_version="$(get_latest_release "${bin_source}")"

# Install Dependencis
mkdir -p "${workdir}" &>/dev/null
apt-get install -qq -y sshpass sqlite3 jq curl

# Install Binary
bin_filename="gegevps-bot-linux"
bin_url="https://github.com/${bin_source}/releases/download/${latest_version}/${bin_filename}"
bin_sha256="$(curl -sS -kL https://github.com/${bin_source}/releases/download/${latest_version}/${bin_filename}.sha256 | sed '/^$/d')"
bin_localpath="/usr/local/bin/${bin_localname}"
systemctl stop gegevps-bot &>/dev/null
until [[ "$(sha256sum "${bin_localpath}" | awk '{print $1}')" == "${bin_sha256}" ]]; do
    wget -qO "${bin_localpath}" "${bin_url}"
    if [[ "$(sha256sum "${bin_localpath}" | awk '{print $1}')" == "${bin_sha256}" ]]; then
        chmod +x "${bin_localpath}"
        echo -e "Binary File Installed"
        systemctl start gegevps-bot &>/dev/null
    fi
done

# Install Tools
path_tools="tools"
path_tools_sha="$(curl -sS -kL https://api.github.com/repos/${bin_source}/git/trees/master?recursive=1 | jq -r '.tree[] | select(.path=="'"${path_tools}"'") | .sha')"
link_tools_source="https://raw.githubusercontent.com/${bin_source}/master/${path_tools}"
data_tools_list="https://api.github.com/repos/${bin_source}/git/trees/${path_tools_sha}?recursive=1"
curl -sS -kL "${data_tools_list}" | jq -r .tree[].path | sed '/\.sh$/!d' | while read list_tools; do
    tools_bin_name="$(echo -e "${list_tools}" | cut -d '.' -f 1)"
    tools_bin_sha256="$(curl -sS -kL ${link_tools_source}/${list_tools}.sha256 | sed '/^$/d')"
    tools_bin_fullpath="/usr/local/bin/${tools_bin_name}"
    if [[ ! -f ${tools_bin_fullpath} ]]; then
        touch ${tools_bin_fullpath}
    fi
    until [[ "$(sha256sum "${tools_bin_fullpath}" | awk '{print $1}')" == "${tools_bin_sha256}" ]]; do
        wget -qO "${tools_bin_fullpath}" "${link_tools_source}/${list_tools}"
    done
    if [[ "$(sha256sum "${tools_bin_fullpath}" | awk '{print $1}')" == "${tools_bin_sha256}" ]]; then
        echo -e "${tools_bin_name} SHA256 is match and installed"
        chmod +x "${tools_bin_fullpath}" 
    else
        echo -e "${tools_bin_name} SHA256 not match"
    fi
done

# Install Crontab
if [[ $(crontab -l | grep -wce "bot-payment-validation") -eq 0 ]]; then
	crontab_temp="$(mktemp)"
	crontab -l > ${crontab_temp}
	echo -e "\n*/1 * * * * /usr/local/bin/bot-payment-validation" >> ${crontab_temp}
	crontab ${crontab_temp}
	rm -rf ${crontab_temp}
fi

# Install Service
DIR_SYSTEMD="/etc/systemd/system"
systemd_service_url="https://raw.githubusercontent.com/${bin_source}/master/${bin_localname}.service"
until [[ -s ${DIR_SYSTEMD}/${bin_localname}.service ]]; do
    wget -qO ${DIR_SYSTEMD}/${bin_localname}.service "${systemd_service_url}"
    if [[ -s ${DIR_SYSTEMD}/${bin_localname}.service ]]; then
        chmod +x ${DIR_SYSTEMD}/${bin_localname}.service
        systemctl daemon-reload
        echo -e "SystemD File Installed"
    fi
done

# Initial
if [[ ! -f "${workdir}/.env" ]]; then
	${bin_localname} &>/dev/null

    # Helper
    echo -e "Kamu bisa mengatur semua konfigurasi pada file"
    echo -e "${workdir}/.env"
    echo -e ""
    echo -e "Kamu bisa menambahkan server pada file JSON"
    echo -e "${workdir}/server_list.json"
    echo -e ""
    echo -e "Kamu bisa mengatur harga Tunnel folder"
    echo -e "${workdir}/price"
fi
