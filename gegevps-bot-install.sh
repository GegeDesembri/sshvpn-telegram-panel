#!/bin/bash

# HTTP Code Check
function http_code(){
	curl --referer "gescripter.blogspot.com" --write-out '%{http_code}' --silent --output /dev/null "$1"
}

# Get Latest Version
get_latest_release() {
	curl -4 --silent "https://api.github.com/repos/$1/releases/latest" | jq -r .tag_name
}

# Parameters
workdir="/etc/gegevps/telegram-bot"
bin_localname="gegevps-bot"
bin_localpath="/usr/local/bin/${bin_localname}"
bin_source="GegeDesembri/sshvpn-telegram-panel"
latest_version="$(get_latest_release "${bin_source}")"
bin_filename="gegevps-bot-linux"

# Install Binary
bin_url="https://github.com/${bin_source}/releases/download/${latest_version}/${bin_filename}"
http_status="$(http_code "${bin_url}")"
if [[ ${http_status} -ne 200 ]]; then
    echo -e "Binary File not Found"
    exit 1
else
    wget -qO "${bin_local}" "${bin_url}"
    chmod +x "${bin_local}"
    echo -e "Binary File Installed"
fi

# Install Dependencis
mkdir -p "${workdir}" &>/dev/null
apt-get install -y sshpass

# Install Service
DIR_SYSTEMD="/etc/systemd/system"
systemd_service_url="https://raw.githubusercontent.com/${bin_source}/master/${bin_localname}.service"
wgetcommand ${DIR_SYSTEMD}/${bin_localname}.service "${systemd_service_url}"
chmod +x ${DIR_SYSTEMD}/${bin_localname}.service
systemctl daemon-reload

# Initial
"${bin_local}" &>/dev/null

# Helper
echo -e "Kamu bisa mengatur semua konfigurasi pada file"
echo -e "${workdir}/.env"
echo -e ""
echo -e "Kamu bisa menambahkan server pada file JSON"
echo -e "${workdir}/server_list.json"
echo -e ""
echo -e "Kamu bisa mengatur harga Tunnel folder"
echo -e "${workdir}/price"
