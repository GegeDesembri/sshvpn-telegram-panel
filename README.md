# SSH/VPN Telegram Panel
Telegram Bot terintegrasi dengan [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script)

## Bot Menu

**Command**

    wget -q -O "/usr/local/bin/bot-menu" "https://raw.githubusercontent.com/GegeDesembri/sshvpn-telegram-panel/master/tools/bot-menu.sh" && \
    chmod +x "/usr/local/bin/bot-menu" && \
    bot-menu

**Note:**
- Instalasi Sudah di test pada OS `Debian 11 x64`

## **Usage**

### Daftar Server

Bot ini mendukung multi server. Kamu bisa memasukkan kredensial server pada array yang telah tersedia pada file JSON `/etc/gegevps/telegram-bot/server_list.json`

    nano /etc/gegevps/telegram-bot/server_list.json

Key `"text"` isi sesuai keinginan untuk Nama server

Contoh

`SG - OVH Cloud`

Format Callback Data

    server_<IP VPS>_<PORT SSH>_root_<ROOT PASSWORD>_<VPS Provider>_<DATACENTER>

Contoh :

    server_23.212.33.44_22_root_PASSWORDNYA_OVH Cloud_SG

**PENTING!!!**

Batas Maksimal karakter dari `callback_data` adalah 64 karakter. Jadi pastikan panjang keseluruhan dari `callback_data` tidak lebih dari 64 karakter. Pada contoh diatas `server_23.212.33.44_22_root_PASSWORDNYA_OVH Cloud_SG` terdiri dari 52 karakter.
    

Untuk lebih jelasnya silahkan kamu lihat contoh filenya disini [Server List JSON](https://github.com/GegeDesembri/sshvpn-telegram-panel/blob/master/example/server_list.json).

### Mengatur Harga

Kamu bisa menyesuaikan harga setiap tunnel dengan mengedit file JSON yang berada pada directory `/etc/gegevps/telegram-bot/price`.

Contoh:

    nano /etc/gegevps/telegram-bot/price/ssh_price.json

Format Callback Data

    <Jumlah Hari>_days_<Harga>

Contoh 

    3_days_2500

Berarti 3 hari seharga `2500`

Begitu juga dengan tipe tunnel yang lain
- `ssh_price.json` : Membatasi jumlah akun **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/price/ssh_price.json`)
- `sevpn_price.json` : Membatasi jumlah akun **SoftetherVPN** (`/etc/gegevps/telegram-bot/price/sevpn_price.json`)
- `vmess_price.json` : Membatasi jumlah akun **VMess** (`/etc/gegevps/telegram-bot/price/vmess_price.json`)
- `vless_price.json` : Membatasi jumlah akun **VLess** (`/etc/gegevps/telegram-bot/price/vless_price.json`)
- `trojan_price.json` : Membatasi jumlah akun **Trojan** (`/etc/gegevps/telegram-bot/price/trojan_price.json`)
- `shadowsocks_price.json` : Membatasi jumlah akun **Shadowsocks** (`/etc/gegevps/telegram-bot/price/shadowsocks_price.json`)
- `socks5_price.json` : Membatasi jumlah akun **Socks5** (`/etc/gegevps/telegram-bot/price/socks5_price.json`)
- `trojango_price.json` : Membatasi jumlah akun **Trojan-Go** (`/etc/gegevps/telegram-bot/price/trojango_price.json`)
- `hysteria_price.json` : Membatasi jumlah akun **Hysteria** (`/etc/gegevps/telegram-bot/price/hysteria_price.json`)
- `udpcustom_price.json` : Membatasi jumlah akun **UDP Custom** (`/etc/gegevps/telegram-bot/price/udpcustom_price.json`)

#### Skema Trial

Bot ini juga mendukung skema pembuatan akun Trial per 1-24 jam. Pengaturannya mirip dengan pengaturan harga namun ada perbedaan. Perhatikan contoh berikut

Contoh:

    nano /etc/gegevps/telegram-bot/price/ssh_price.json

Format Callback Data

    <Jumlah Jam>_hours_<Harga>

Contoh 

    3_hours_0

Berarti akan dibuat akun yang akan terhapus otomatis dalam 3 jam dengan harga `0` (_Harga `0` artinya pembuatan akun ini tidak akan memotong saldo Klien_)

### Pesan Selamat Datang

Kamu bisa menyesuaikan pesan selamat datang pada file `/etc/gegevps/telegram-bot/mainmenu_welcome.txt`

    nano /etc/gegevps/telegram-bot/mainmenu_welcome.txt

### Batas Jumlah Akun

Untuk membatasi jumlah akun setiap server bisa dilakukan dengan mengaturnya pada directory `/etc/gegevps/telegram-bot/limiter` di VPS Client.

Contoh: Membatasi jumlah akun SSH/OpenVPN hanya 10 akun saja

    mkdir -p /etc/gegevps/telegram-bot/limiter &>/dev/null
    echo -n 10 > /etc/gegevps/telegram-bot/limiter/limit_ssh

Begitu juga dengan tipe tunnel yang lain
- `limit_ssh` : Membatasi jumlah akun **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/limiter/limit_ssh`)
- `limit_sevpn` : Membatasi jumlah akun **SoftetherVPN** (`/etc/gegevps/telegram-bot/limiter/limit_sevpn`)
- `limit_vmess` : Membatasi jumlah akun **VMess** (`/etc/gegevps/telegram-bot/limiter/limit_vmess`)
- `limit_vless` : Membatasi jumlah akun **VLess** (`/etc/gegevps/telegram-bot/limiter/limit_vless`)
- `limit_trojan` : Membatasi jumlah akun **Trojan** (`/etc/gegevps/telegram-bot/limiter/limit_trojan`)
- `limit_shadowsocks` : Membatasi jumlah akun **Shadowsocks** (`/etc/gegevps/telegram-bot/limiter/limit_shadowsocks`)
- `limit_socks5` : Membatasi jumlah akun **Socks5** (`/etc/gegevps/telegram-bot/limiter/limit_socks5`)
- `limit_trojango` : Membatasi jumlah akun **Trojan-Go** (`/etc/gegevps/telegram-bot/limiter/limit_trojango`)
- `limit_hysteria` : Membatasi jumlah akun **Hysteria** (`/etc/gegevps/telegram-bot/limiter/limit_hysteria`)
- `limit_udpcustom` : Membatasi jumlah akun **UDP Custom** (`/etc/gegevps/telegram-bot/limiter/limit_udpcustom`)

# Catatan

- Pembayaran yang didukung hanya [Tripay](https://tripay.co.id/).
- Jangan lupa untuk memasukkan IP Server Telegram Bot pada IP Whitelist di [Tripay Merchant](https://tripay.co.id/member/merchant)
- Server yang masuk dalam bot ini wajib menggunakan script [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script). Jika tidak, maka server tidak akan merespon.
- Pengaturan diawal cukup rumit. Jika butuh bantuan penginstallan silahkan chat [Admin](https://t.me/GegeVPS)
