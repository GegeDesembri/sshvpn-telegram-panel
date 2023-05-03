# SSH/VPN Telegram Panel
Telegram Bot terintegrasi dengan [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script)

## Install

**Command**

`wget -qO- "https://raw.githubusercontent.com/GegeDesembri/sshvpn-telegram-panel/master/gegevps-bot-install.sh" | bash -`

**Note:**
- Instalasi Sudah di test pada OS `Debian 11 x64`

## **Usage**

### Parameter Inti

Ada beberapa parameter yang harus diatur dahulu sebelum bot dapat digunakan. Parameter tersebut bisa kamu sesuaikan pada file `/etc/gegevps/telegram-bot/.env`.

1. Ganti `your_license_key` dengan license key yang kamu dapatkan dari Admin

`LICENSE_KEY='your_license_key'`

2. Ganti `your_bot_token` dengan Token Bot yang telah kamu buat

`BOT_TOKEN='your_bot_token'`

3. Ganti `tripay_apikey` dengan API Key yang kamu dapatkan dari Tripay

`TRIPAY_APIKEY='tripay_apikey'`

4. Ganti `tripay_privatekey` dengan Private Key yang kamu dapatkan dari Tripay

`TRIPAY_PRIVATEKEY='tripay_privatekey'`

5. Ganti `tripay_merchantcode` dengan Merchant Code yang kamu dapatkan dari Tripay

`TRIPAY_MCODE='tripay_merchantcode'`

6. Ganti `tripay_payment_method` dengan Payment Method sesuai pengaturan Tripay

`TRIPAY_PAYMETHOD='tripay_payment_method'`

### Daftar Server

Bot ini mendukung multi server. Kamu bisa memasukkan kredensial server pada array yang telah tersedia pada file JSON `/etc/gegevps/telegram-bot/server_list.json`

`nano /etc/gegevps/telegram-bot/server_list.json`

Key `"text"` isi sesuai keinginan untuk Nama server

Contoh

`SG - OVH Cloud`

Format Callback Data

`server_<IP VPS>_<PORT SSH>_root_<ROOT PASSWORD>_<VPS Provider>_<DATACENTER>`

Contoh :

`server_23.212.33.44_22_root_PASSWORDNYA_OVH Cloud_SG`

Untuk lebih jelasnya silahkan kamu lihat contoh filenya disini [Server List JSON](https://github.com/GegeDesembri/sshvpn-telegram-panel/blob/master/example/server_list.json).


### Mengatur Harga

Kamu bisa menyesuaikan harga setiap tunnel dengan mengedit file JSON yang berada pada directory `/etc/gegevps/telegram-bot/price`.

Contoh: 
`nano /etc/gegevps/telegram-bot/price/ssh_price.json`

# Catatan

- Pembayaran yang didukung hanya Tripay.
- Server yang masuk dalam bot ini wajib menggunakan script [SSH/VPN Script](https://github.com/GegeDesembri/sshvpn-script). Jika tidak, maka server tidak akan merespon.
