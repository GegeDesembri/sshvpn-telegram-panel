#!/bin/bash

workdir="/etc/gegevps/telegram-bot"
source "${workdir}/.env"
sqlite_name="telegram-sessions.sqlite"
sqlite_fullpath="${workdir}/${sqlite_name}"
tripay_apikey="${TRIPAY_APIKEY}"
invoice_list="$(echo -e 'SELECT * FROM invoice_database WHERE status = "UNPAID"' | sqlite3 ${sqlite_fullpath})"

echo -e "${invoice_list}" | while read invoices; do
    reference="$(echo -e "${invoices}" | cut -d '|' -f 3)"
    trx_date="$(echo -e "${invoices}" | cut -d '|' -f 4 | cut -d ' ' -f 1)"
    telegram_id_db="$(echo -e "${invoices}" | cut -d '|' -f 2)"
    
    update_data="$(curl -sS -kL -X GET "https://tripay.co.id/api/transaction/detail?reference=${reference}" -H "Authorization: Bearer ${tripay_apikey}")"
    
    telegram_id_pg="$(echo -e "${update_data}" | jq -r .data.merchant_ref)"
    paymenthod="$(echo -e "${update_data}" | jq -r .data.payment_method)"
    # amount="$(echo -e "${update_data}" | jq -r .data.amount_received)"
    amount="$(echo -e "${update_data}" | jq -r .data.amount)"
    status="$(echo -e "${update_data}" | jq -r .data.status)"

    telegram_id="${telegram_id_pg}"
    if [[ "${status}" == 'PAID' ]]; then
        echo -e 'SELECT * FROM billing_database WHERE telegram_id = "'"${telegram_id}"'" ORDER BY id DESC LIMIT 1;' | sqlite3 ${sqlite_fullpath} | while read trx_last; do
            prev_balance="$(echo -e "${trx_last}" | cut -d '|' -f 10)"
            after_balance="$(expr ${prev_balance} + ${amount})"
        
            echo -e 'INSERT INTO billing_database (telegram_id, tunnel_type, tunnel_type, username, trx_date, duration, price, prev_balance, after_balance) VALUES ("'"${telegram_id}"'", "0.0.0.0", "TOPUP", "TOPUP", "PAID", "'"${trx_date}"'", "0", "'"${amount}"'", "'"${prev_balance}"'", "'"${after_balance}"'")' | sqlite3 ${sqlite_fullpath}
        done
        echo -e 'UPDATE invoice_database SET status = "PAID" WHERE reference = "'"${reference}"'";' | sqlite3 ${sqlite_fullpath}
    elif [[ "${status}" == 'EXPIRED' ]]; then
        echo -e 'UPDATE invoice_database SET status = "EXPIRED" WHERE reference = "'"${reference}"'";' | sqlite3 ${sqlite_fullpath}
    fi
done
echo -e "Checked"

