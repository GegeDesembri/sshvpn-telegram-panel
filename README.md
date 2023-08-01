# SSH/VPN Telegram Panel
Telegram Bot terintegrasi dengan [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script)

## Docs Index

> [**Docs Index**](https://github.com/GegeDesembri/sshvpn-telegram-panel#docs-index)

> [**Daftar Fitur**](https://github.com/GegeDesembri/sshvpn-telegram-panel#daftar-fitur)

> [**Install Bot Menu**](https://github.com/GegeDesembri/sshvpn-telegram-panel#install-bot-menu)

> [**Usage**](https://github.com/GegeDesembri/sshvpn-telegram-panel#usage)
- [Melihat Profile ID](https://github.com/GegeDesembri/sshvpn-telegram-panel#melihat-profile-id)
- [Pesan Selamat Datang](https://github.com/GegeDesembri/sshvpn-telegram-panel#pesan-selamat-datang)
- [Pilihan Tunnel Main Menu](https://github.com/GegeDesembri/sshvpn-telegram-panel#pilihan-tunnel-main-menu)
- [Daftar Server](https://github.com/GegeDesembri/sshvpn-telegram-panel#daftar-server)
- [Informasi Tunnel](https://github.com/GegeDesembri/sshvpn-telegram-panel#informasi-tunnel)
- [Mengatur Harga Buyer](https://github.com/GegeDesembri/sshvpn-telegram-panel#mengatur-harga-buyer)
- [Mengatur Harga Reseller](https://github.com/GegeDesembri/sshvpn-telegram-panel#mengatur-harga-reseller)
- [Harga per Server](https://github.com/GegeDesembri/sshvpn-telegram-panel#harga-per-server)
- [Batas Jumlah akun](https://github.com/GegeDesembri/sshvpn-telegram-panel#batas-jumlah-akun)
- [Role Level](https://github.com/GegeDesembri/sshvpn-telegram-panel#role-level)
- [Notes](https://github.com/GegeDesembri/sshvpn-telegram-panel#notes)
- [Melihat Log](https://github.com/GegeDesembri/sshvpn-telegram-panel#melihat-log)

> [**Catatan**](https://github.com/GegeDesembri/sshvpn-telegram-panel#catatan)

## Daftar Fitur
- **Payment Integration**: Terintegrasi dengan [Tripay Payment Gateway](https://tripay.co.id/member/)
- **Multiple Bot**: 1 Host bisa menjalankan beberapa bot server secara bersamaan
- **Multiple Server**: 1 bot bisa terhubung ke beberapa Server Tunnel
- **Role Leveler**: Bot dapat diatur untuk dapat menentukan pelanggan sebagai `buyer`, `reseller`, atau `admin`
- **Customizable**: Bisa ubah sesuaikan sesuai kebutuhan dan keinginan
- **Limitable**: Pembatasan slot akun untuk masing-masing server tunnel
- **Trial Test**: Menyediakan akun trial untuk percobaan secara langsung dapat durasi per jam yang dapat disesuaikan
- **Trial Limit**: Membatasi jumlah pembuatan akun per hari untuk masing-masing buyer /Tunnel/Server
- **Notes**: Membuat sebuah catatan yang dapat baca oleh pengunjung bot

## Install Bot Menu

**Command**

```shell
wget -q -O "/usr/local/bin/bot-menu" "https://raw.githubusercontent.com/GegeDesembri/sshvpn-telegram-panel/master/tools/bot-menu.sh" && \
chmod +x "/usr/local/bin/bot-menu" && \
bot-menu
```

**Note:**
- Instalasi Sudah di test pada OS `Debian 11 x64`

## **Usage**

### Melihat Profile ID

Untuk melihat Profile ID gunakan perintah berikut dan sesuaikan nama profile

```shell
gegevps-bot --profile="<profile_name>" --hwid
```

### Pesan Selamat Datang

Kamu bisa menyesuaikan pesan selamat datang pada file `/etc/gegevps/telegram-bot/<profile_name>/mainmenu_welcome.txt`

```shell
nano /etc/gegevps/telegram-bot/<profile_name>/mainmenu_welcome.txt
```

### Pilihan Tunnel Main Menu

Kamu bisa menyesuaikan pilihan tunnel pada main menu pada file `/etc/gegevps/telegram-bot/<profile_name>/mainmenu_button.json`

```shell
nano /etc/gegevps/telegram-bot/<profile_name>/mainmenu_button.json
```

### Daftar Server

Bot ini mendukung multi server. Kamu bisa memasukkan kredensial server pada array yang telah tersedia pada file JSON `/etc/gegevps/telegram-bot/<nama_profile>/server_list.json`

```shell
    nano /etc/gegevps/telegram-bot/<nama_profile>/server_list.json
```

Key `"text"` isi sesuai keinginan untuk Nama server

Contoh

```
`SG - OVH Cloud`
```

Format Callback Data

```
server_<IP VPS>_<PORT SSH>_root_<ROOT PASSWORD>_<VPS Provider>_<DATACENTER>
```

Contoh :

```
server_23.212.33.44_22_root_PASSWORDNYA_OVH Cloud_SG
```

**PENTING!!!**

Batas Maksimal karakter dari `callback_data` adalah 64 karakter. Jadi pastikan panjang keseluruhan dari `callback_data` tidak lebih dari 64 karakter. Pada contoh diatas `server_23.212.33.44_22_root_PASSWORDNYA_OVH Cloud_SG` terdiri dari 52 karakter.
    

Untuk lebih jelasnya silahkan kamu lihat contoh filenya disini [Server List JSON](https://github.com/GegeDesembri/sshvpn-telegram-panel/blob/master/example/server_list.json).

### Informasi Tunnel

Kamu bisa mengubah pesan setiap jenis tunnel dengan file `msgtext`. Disini berlaku menggunakan HTML Tag.

Contohnya untuk mengedit pesan SSH/OpenVPN
```shell
nano /etc/gegevps/telegram-bot/default/msgtext/ssh_text.txt
```

Begitu juga dengan tipe tunnel yang lain
- `ssh_text.txt` : Pesan pembuka **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/ssh_text.txt`)
- `sevpn_text.txt` : Pesan pembuka **SoftetherVPN** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/sevpn_text.txt`)
- `vmess_text.txt` : Pesan pembuka **VMess** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/vmess_text.txt`)
- `vless_text.txt` : Pesan pembuka **VLess** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/vless_text.txt`)
- `trojan_text.txt` : Pesan pembuka **Trojan** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/trojan_text.txt`)
- `shadowsocks_text.txt` : Pesan pembuka **Shadowsocks** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/shadowsocks_text.txt`)
- `socks5_text.txt` : Pesan pembuka **Socks5** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/socks5_text.txt`)
- `trojango_text.txt` : Pesan pembuka **Trojan-Go** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/trojango_text.txt`)
- `hysteria_text.txt` : Pesan pembuka **Hysteria** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/hysteria_text.txt`)
- `udpcustom_text.txt` : Pesan pembuka **UDP Custom** (`/etc/gegevps/telegram-bot/<profile_name>/msgtext/udpcustom_text.txt`)

### Mengatur Harga Buyer

Kamu bisa menyesuaikan harga setiap tunnel dengan mengedit file JSON yang berada pada directory `/etc/gegevps/telegram-bot/price`.

Contoh:

```shell
nano /etc/gegevps/telegram-bot/<profile_name>/price/ssh_price.json
```

Format Callback Data

```shell
<Jumlah Hari>_days_<Harga>
```

Contoh 

```shell
3_days_2500
```

Berarti 3 hari seharga `2500`

Begitu juga dengan tipe tunnel yang lain
- `ssh_price.json` : Daftar harga **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price/ssh_price.json`)
- `sevpn_price.json` : Daftar harga **SoftetherVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price/sevpn_price.json`)
- `vmess_price.json` : Daftar harga **VMess** (`/etc/gegevps/telegram-bot/<profile_name>/price/vmess_price.json`)
- `vless_price.json` : Daftar harga **VLess** (`/etc/gegevps/telegram-bot/<profile_name>/price/vless_price.json`)
- `trojan_price.json` : Daftar harga **Trojan** (`/etc/gegevps/telegram-bot/<profile_name>/price/trojan_price.json`)
- `shadowsocks_price.json` : Daftar harga **Shadowsocks** (`/etc/gegevps/telegram-bot/<profile_name>/price/shadowsocks_price.json`)
- `socks5_price.json` : Daftar harga **Socks5** (`/etc/gegevps/telegram-bot/<profile_name>/price/socks5_price.json`)
- `trojango_price.json` : Daftar harga **Trojan-Go** (`/etc/gegevps/telegram-bot/<profile_name>/price/trojango_price.json`)
- `hysteria_price.json` : Daftar harga **Hysteria** (`/etc/gegevps/telegram-bot/<profile_name>/price/hysteria_price.json`)
- `udpcustom_price.json` : Daftar harga **UDP Custom** (`/etc/gegevps/telegram-bot/<profile_name>/price/udpcustom_price.json`)

Mengatur harga untuk Renew
- `ssh_price_renew.json` : Daftar harga **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price/ssh_price_renew.json`)
- `sevpn_price_renew.json` : Daftar harga **SoftetherVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price/sevpn_price_renew.json`)
- `vmess_price_renew.json` : Daftar harga **VMess** (`/etc/gegevps/telegram-bot/<profile_name>/price/vmess_price_renew.json`)
- `vless_price_renew.json` : Daftar harga **VLess** (`/etc/gegevps/telegram-bot/<profile_name>/price/vless_price_renew.json`)
- `trojan_price_renew.json` : Daftar harga **Trojan** (`/etc/gegevps/telegram-bot/<profile_name>/price/trojan_price_renew.json`)
- `shadowsocks_price_renew.json` : Daftar harga **Shadowsocks** (`/etc/gegevps/telegram-bot/<profile_name>/price/shadowsocks_price.json`)
- `socks5_price_renew.json` : Daftar harga **Socks5** (`/etc/gegevps/telegram-bot/<profile_name>/price/socks5_price_renew.json`)
- `trojango_price_renew.json` : Daftar harga **Trojan-Go** (`/etc/gegevps/telegram-bot/<profile_name>/price/trojango_price_renew.json`)
- `hysteria_price_renew.json` : Daftar harga **Hysteria** (`/etc/gegevps/telegram-bot/<profile_name>/price/hysteria_price_renew.json`)
- `udpcustom_price_renew.json` : Daftar harga **UDP Custom** (`/etc/gegevps/telegram-bot/<profile_name>/price/udpcustom_price_renew.json`)

### Mengatur Harga Reseller

Kamu bisa menyesuaikan harga khusus untuk Reseller yang terdaftar setiap tunnel dengan mengedit file JSON yang berada pada directory `/etc/gegevps/telegram-bot/<profile_name>/price_reseller`.

Contoh:

```shell
nano /etc/gegevps/telegram-bot/<profile_name>/price_reseller/ssh_price.json
```

Format Callback Data

```shell
<Jumlah Hari>_days_<Harga>
```

Contoh 

```shell
3_days_2500
```

Berarti 3 hari seharga `2500`

Begitu juga dengan tipe tunnel yang lain
- `ssh_price.json` : Daftar harga **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/ssh_price.json`)
- `sevpn_price.json` : Daftar harga **SoftetherVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/sevpn_price.json`)
- `vmess_price.json` : Daftar harga **VMess** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/vmess_price.json`)
- `vless_price.json` : Daftar harga **VLess** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/vless_price.json`)
- `trojan_price.json` : Daftar harga **Trojan** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/trojan_price.json`)
- `shadowsocks_price.json` : Daftar harga **Shadowsocks** (`/etc/gegevps/telegram-bot/<profile_name>/price/shadowsocks_price.json`)
- `socks5_price.json` : Daftar harga **Socks5** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/socks5_price.json`)
- `trojango_price.json` : Daftar harga **Trojan-Go** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/trojango_price.json`)
- `hysteria_price.json` : Daftar harga **Hysteria** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/hysteria_price.json`)
- `udpcustom_price.json` : Daftar harga **UDP Custom** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/udpcustom_price.json`)

Mengatur harga untuk Renew untuk Reseller
- `ssh_price_renew.json` : Daftar harga **SSH/OpenVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/ssh_price_renew.json`)
- `sevpn_price_renew.json` : Daftar harga **SoftetherVPN** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/sevpn_price_renew.json`)
- `vmess_price_renew.json` : Daftar harga **VMess** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/vmess_price_renew.json`)
- `vless_price_renew.json` : Daftar harga **VLess** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/vless_price_renew.json`)
- `trojan_price_renew.json` : Daftar harga **Trojan** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/trojan_price_renew.json`)
- `shadowsocks_price_renew.json` : Daftar harga **Shadowsocks** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/shadowsocks_price.json`)
- `socks5_price_renew.json` : Daftar harga **Socks5** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/socks5_price_renew.json`)
- `trojango_price_renew.json` : Daftar harga **Trojan-Go** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/trojango_price_renew.json`)
- `hysteria_price_renew.json` : Daftar harga **Hysteria** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/hysteria_price_renew.json`)
- `udpcustom_price_renew.json` : Daftar harga **UDP Custom** (`/etc/gegevps/telegram-bot/<profile_name>/price_reseller/udpcustom_price_renew.json`)

### Harga per Server

Kamu dapat membuat harga yang berbeda untuk masing-masing server dengan mengikuti cara berikut ini.

Misalnya terdapat 2 server tunnel
1. Server Biznet dengan ip `103.123.44.55`
2. Server DigitalOcean dengan ip `128.22.33.44`

Harga default untuk tunnel SSH/OpenVPN pada semua server adalah 10000 / 30 hari.

Jika kamu ingin membedakan harga untuk tunnel SSH pada server DigitalOcean misalnya 5000 / 30 hari. Silahkan ikuti petunjuk berikut ini.

1. Buat directory harga khusus untuk VPS yang diinginkan dengan nama directory menggunakan _IP_VPS_.

```bash
mkdir -p /etc/gegevps/telegram-bot/<profile_name>/price/<IP_VPS>
```

2. Salin file `.json` harga `default` untuk pembelian **Create** dan **Renew**

```bash
cp /etc/gegevps/telegram-bot/<profile_name>/price/ssh_price.json /etc/gegevps/telegram-bot/<profile_name>/price/<IP_VPS>/ssh_price.json
cp /etc/gegevps/telegram-bot/<profile_name>/price/ssh_price_renew.json /etc/gegevps/telegram-bot/<profile_name>/price/<IP_VPS>/ssh_price_renew.json
```

3. Sekarang kamu bisa menentukan harga **Create** dan **Renew** khusus untuk Server dengan _IP_VPS_

```bash
# Edit Harga Create
nano /etc/gegevps/telegram-bot/<profile_name>/price/<IP_VPS>/ssh_price.json
```

```bash
# Edit Harga Renew
nano /etc/gegevps/telegram-bot/<profile_name>/price/<IP_VPS>/ssh_price_renew.json
```

**Catatan:**
- Ganti `<profile_name>` sesuai dengan nama profile bot yang kamu miliki
- Ganti `<IP_VPS>` sesuai dengan IP VPS yang ingin kamu berikan harga khusus
- Kamu tidak harus membuat file `.json` untuk semua tunnel pada harga khusus.
- Jika kamu ingin membedakan harga hanya untuk SSH/OpenVPN saja cukup buat file `ssh_price.json` dan `ssh_price_renew.json` saja begitu juga untuk tunnel `sevpn`, `vmess`, dan lainnya. Sedangkan untuk jenis tunnel yang lain akan menggunakan harga `default`.
- Kamu juga dapat membedakan harga untuk _Role Level_ `reseller` dengan melakukan hal yang sama pada directory `/etc/gegevps/telegram-bot/<profile_name>/price_reseller`

#### Skema Trial

Bot ini juga mendukung skema pembuatan akun Trial per 1-24 jam. Pengaturannya mirip dengan pengaturan harga namun ada perbedaan. Perhatikan contoh berikut

Contoh:

```shell
nano /etc/gegevps/telegram-bot/<profile_name>/price/ssh_price.json
```

Format Callback Data

```shell
<Jumlah Jam>_hours_<Harga>
```

Contoh 

```
3_hours_0
```

Berarti akan dibuat akun yang akan terhapus otomatis dalam 3 jam dengan harga `0` (_Harga `0` artinya pembuatan akun ini tidak akan memotong saldo Klien_)

### Batas Jumlah Akun

Untuk membatasi jumlah akun setiap server bisa dilakukan dengan mengaturnya pada directory `/etc/gegevps/telegram-bot/limiter` di VPS Client.

Contoh: Membatasi jumlah akun SSH/OpenVPN hanya 10 akun saja

```shell
mkdir -p /etc/gegevps/telegram-bot/limiter &>/dev/null
echo -n 10 > /etc/gegevps/telegram-bot/limiter/limit_ssh
```

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

### Role Level

Bot ini mendukung sistem Role Level. Role Level yang dapat digunakan yaitu `buyer`, `reseller`, dan `admin`. Masing-masing Role Level memiliki hak akses yang berbeda. Berikut adalah daftar akses yang dimiliki oleh masing-masing Role Level

#### Buyer
- Pembatasan pembuatan akun Trial
- Akses terbatas pembeli normal pada umumnya

Secara _default_ semua pengunjung bot akan mendapatkan Role Level ini jika Telegram IDnya tidak terdaftar sebagai `reseller` dan `admin`.

#### Reseller
- Pembuatan Trial tanpa pembatasan
- Perbedaan harga dengan pembeli normal

Kamu bisa menambahkan daftar `reseller` pada file `/etc/gegevps/telegram-bot/<profile_name>/admin_roles.json` dengan memasukkan Telegram ID pada file tersebut dengan format JSON Array dengan tipe data `String` (diapit oleh tanda petik 2).

Contoh:
```json
[
    "1025920145",
    "928746698"
]
```

#### Admin
- Kebebasan pembuatan akun

Kamu bisa menambahkan daftar admin pada file `/etc/gegevps/telegram-bot/<profile_name>/admin_roles.json` dengan memasukkan Telegram ID pada file tersebut dengan format JSON Array dengan tipe data `string` (diapit oleh tanda petik 2).

Contoh:
```json
[
    "1025920145",
    "928746698"
]
```

### Notes

Mendukung sistem notasi menggunakan perintah `/notes` maka akan menampilkan daftar catatan yang dapat dibaca oleh visitor. Fitur notes juga mendukung catatan khusus pengguna tunnel aktif.

#### Cara membuat Notes

Kamu bisa membuat sebuah notes dengan menempatkan file `.txt` pada directory `/etc/gegevps/telegram-bot/<profile_name>/notes`.

Jika kamu memerlukan sebuah contoh file notes silahkan buka file `/etc/gegevps/telegram-bot/<profile_name>/notes/init_notes.txt`.

Catatan khusus pengguna yang memiliki akun aktif dapat ditambahkan ekstensi `.paid`. Contoh: `rahasia.txt` menjadi `rahasia.txt.paid`

Notes mendukung format [**HTML Tag**](https://core.telegram.org/bots/api#html-style) sesuai docs yang telah ditentukan oleh Telegram.

**PENTING!!!**

Ada beberapa hal yang perlu diperhatikan dalam penulisan Notes.

Terdapat 3 karakter yang tidak bisa ditulis secara langsung jika kamu ingin menggunakannya sebagai penulisan buka pemformatan HTML Tag yaitu

- `<` harus ditulis menggunakan sintaks `&lt;`
- `>` harus ditulis menggunakan sintaks `&gt;`
- `&` harus ditulis menggunakan sintaks `&amp;`

#### Cara mengambil Notes

Kamu bisa mengambil notes yang tersedia pada bot dengan mengirimkan pesan `#nama_notes`. Contoh: `#rahasia`

### Melihat Log

Untuk melihat log gunakan perintah berikut dan sesuaikan nama profile

Install Module LNAV

```shell
apt-get install -y lnav
```
Buka Realtime Log menggunakan command berikut ini

```shell
lnav /var/log/gegevps-bot/<profile_name>/activity.log
```

# Catatan

- Pembayaran yang didukung hanya [Tripay](https://tripay.co.id/).
- Jangan lupa untuk memasukkan IP Server Telegram Bot pada IP Whitelist di [Tripay Merchant](https://tripay.co.id/member/merchant)
- Server yang masuk dalam bot ini wajib menggunakan script [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script). Jika tidak, maka server tidak akan merespon.
- Pengaturan diawal cukup rumit. Jika butuh bantuan penginstallan silahkan chat [Admin](https://t.me/GegeVPS)
