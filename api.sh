echo -n "[+] Input Your Auth_Key: "
read AUTH
apt update && apt upgrade -y
apt install python3-pip python3
pip3 install flask
tee -a /etc/systemd/system/api.service<<END
[Unit]
Description=My Project
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 /usr/bin/api.py 0.0.0.0 $AUTH
Restart=always

[Install]
WantedBy=multi-user.target
END
wget -q -O /usr/bin/api.py https://raw.githubusercontent.com/Deadrz/XONTOLPANEL/main/api.py && chmod +x /usr/bin/api.py
systemctl start api
systemctl enable api
echo "[+] API Installation Completed."
