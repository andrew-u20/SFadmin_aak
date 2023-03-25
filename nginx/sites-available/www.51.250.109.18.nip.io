server {
    listen 80;
    server_name www.51.250.109.18.nip.io 51.250.109.18.nip.io;
    return 301 https://51.250.109.18.nip.io$request_uri;
}

server {
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/51.250.109.18.nip.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/51.250.109.18.nip.io/privkey.pem;
    server_name www.51.250.109.18.nip.io;
    return 301 https://51.250.109.18.nip.io$request_uri;
}

server {
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/51.250.109.18.nip.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/51.250.109.18.nip.io/privkey.pem;
    server_name 51.250.109.18.nip.io;
    root /var/www/51.250.109.18.nip.io;
    index tux.png;
    autoindex on;
    autoindex_exact_size off;
    autoindex_localtime on;

    location / {
    }
}



server {
    listen 80;
    server_name www.zabbix.51.250.109.18.nip.io zabbix.51.250.109.18.nip.io;
    return 301 https://zabbix.51.250.109.18.nip.io$request_uri;
}


server {
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/51.250.109.18.nip.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/51.250.109.18.nip.io/privkey.pem;
    server_name www.zabbix.51.250.109.18.nip.io;
    return 301 https://zabbix.51.250.109.18.nip.io$request_uri;
}

server {
    listen 443 ssl;
    server_name zabbix.51.250.109.18.nip.io;
    ssl_certificate /etc/letsencrypt/live/51.250.109.18.nip.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/51.250.109.18.nip.io/privkey.pem;
    location / {
        proxy_pass         https://127.0.0.1:8081;
	proxy_set_header Host $host;
	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-Host $host;
	proxy_set_header X-Forwarded-Server $host;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-Forwarded-Proto $scheme;
	proxy_set_header X-Server-Address  $server_addr;
    }
}
