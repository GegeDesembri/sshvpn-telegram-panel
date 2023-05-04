# SSH/VPN Telegram Panel
Telegram Bot terintegrasi dengan [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script)

## Install

**Command**

    wget -qO- "https://raw.githubusercontent.com/GegeDesembri/sshvpn-telegram-panel/master/gegevps-bot-install.sh" | bash -

**Note:**
- Instalasi Sudah di test pada OS `Debian 11 x64`

## **Usage**

### Parameter Inti

Ada beberapa parameter yang harus diatur dahulu sebelum bot dapat digunakan. Parameter tersebut bisa kamu sesuaikan pada file `/etc/gegevps/telegram-bot/.env`.

1. Ganti `your_license_key` dengan license key yang kamu dapatkan dari [Admin](https://t.me/GegeVPS)

    `LICENSE_KEY='your_license_key'`

2. Ganti `your_bot_token` dengan Token Bot yang telah kamu buat di [BotFather](https://t.me/BotFather)

    `BOT_TOKEN='your_bot_token'`

3. Ganti `tripay_apikey` dengan API Key yang kamu dapatkan dari [Tripay](https://tripay.co.id/)

    `TRIPAY_APIKEY='tripay_apikey'`

4. Ganti `tripay_privatekey` dengan Private Key yang kamu dapatkan dari [Tripay](https://tripay.co.id/)

    `TRIPAY_PRIVATEKEY='tripay_privatekey'`

5. Ganti `tripay_merchantcode` dengan Merchant Code yang kamu dapatkan dari [Tripay](https://tripay.co.id/)

    `TRIPAY_MCODE='tripay_merchantcode'`

6. Ganti `tripay_payment_method` dengan Payment Method sesuai pengaturan [Tripay](https://tripay.co.id/) untuk melihat kodenya bisa ke [API Developer Guide - Channels](https://tripay.co.id/developer?tab=channels#channels)

    `TRIPAY_PAYMETHOD='tripay_payment_method'`

6. Ganti Init Balance `9999999999` menjadi 0 atau berapapun yang kamu mau selain nilai default

    `INIT_BALANCE='9999999999'`

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

Berarti 3 hari seharga 2500

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
- Server yang masuk dalam bot ini wajib menggunakan script [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script). Jika tidak, maka server tidak akan merespon.
- Pengaturan diawal cukup rumit. Jika butuh bantuan penginstallan silahkan chat [Admin](https://t.me/GegeVPS)
