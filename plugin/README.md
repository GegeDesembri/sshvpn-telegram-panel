
# Pembuatan Plugin

## Tabel Arguments
Sintaks : `Bash Shell`
|Name|$1|$2|$3|$4|$5|
|--|--|--|--|--|--|
|telegram-**ssh**-create|`<Profile ID>`|`<username>`|`<password>`|`<expired>`|`none`|
|telegram-**ssh**-trial|`<Profile ID>`|`<username>`|`<password>`|`<expired>`|`none`|
|telegram-**sevpn**-create|`<Profile ID>`|`<username>`|`<password>`|`<expired>`|`none`|
|telegram-**sevpn**-trial|`<Profile ID>`|`<username>`|`<password>`|`<expired>`|`none`|
|telegram-**vmess**-create|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**vmess**-trial|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**vless**-create|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**vless**-trial|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**trojan**-create|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**trojan**-trial|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**shadowsocks**-create|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**shadowsocks**-trial|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**socks5**-create|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**socks5**-trial|`<Profile ID>`|`<username>`|`<password>`|`<core>`|`<expired>`|
|telegram-**hysteria**-create|`<Profile ID>`|`<username>`|`<expired>`|`none`|`none`|
|telegram-**hysteria**-trial|`<Profile ID>`|`<username>`|`<expired>`|`none`|`none`|
|telegram-**trojango**-create|`<Profile ID>`|`<username>`|`<expired>`|`none`|`none`|
|telegram-**trojango**-trial|`<Profile ID>`|`<username>`|`<expired>`|`none`|`none`|
|telegram-**udpcustom**-create|`<Profile ID>`|`<username>`|`<expired>`|`none`|`none`|
|telegram-**udpcustom**-trial|`<Profile ID>`|`<username>`|`<expired>`|`none`|`none`|

## Penjelasan Arguments

Parameter yang digunakan merujuk pada script [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script) sehingga penjelasan ini akan sesuai yang digunakan pada script tersebut.

Plugin memiliki 3-5 parameter yang akan digunakan dalam pembuatan akun.

1. Parameter `Profile ID atau License Key`. Semua plugin pada argument `$1`/pertama akan memiliki license key yang digunakan pada Bot telegram.
2. Parameter `username`. Semua plugin pada argument `$2`/kedua akan memiliki `username` yang dikirimkan oleh bot.
3. Parameter `username`. Semua plugin pada argument `$3`/ketiga akan memiliki `password`/`expired` yang dikirimkan oleh bot.
4. Parameter `username`. Semua plugin pada argument `$4`/keempat akan memiliki `core`/`expired` yang dikirimkan oleh bot.
5. Parameter `username`. Semua plugin pada argument `$5`/kelima akan memiliki `expired` yang dikirimkan oleh bot.

Lebih jelasnya tentang isian masing-masing Argumen bisa dilihat pada tabel di atas.

## Contoh Penggunakan Arguments

Berikut ini adalah contoh penggunaan Argument

Script: `telegram-vmess-create`
```shell
#!/bin/bash

license_key="$1" // Disini berisi licensekey
username="$2" // Disini berisi Username
password="$3" // Disini berisi  UUID
core="$4" // Disini berisi Core yang akan digunakan
expire="$5" // Disini berisi lama waktu kadaluarsa

echo -e "${license_key}"
echo -e "${username}"
echo -e "${password}"
echo -e "${core}"
echo -e "${expire}"

................
```
Testing : `telegram-vmess-create "ini_lisensi" "ini_username" "ini_password" "ini_core" "ini_jumlahhari"`

Output:
```text
ini_lisensi
ini_username
ini_password
ini_core
ini_jumlahhari
```
