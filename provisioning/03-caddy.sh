#!/bin/bash

# install caddy server
curl https://getcaddy.com | bash -s personal hook.service,http.ipfilter,http.mailout,http.webdav

# create sample Caddyfile
mkdir -p /etc/caddy
cat > /etc/caddy/Caddyfile <<EOL
:80 {
    root /var/www
}
EOL

# create sample webpage
mkdir -p /var/www
chown vagrant:vagrant /var/www
cat > /var/www/index.html <<EOL
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Midas Server</title>
</head>
<body>
  <h1>Midas Server</h1>
  <p>Hello World!</p>
</body>
</html>
EOL

# install caddy as service
echo "caddy as service..."
caddy -service install -conf /etc/caddy/Caddyfile
caddy -service start

cat >> ~/.bashrc <<EOL
# fix file descriptor limit (caddy will complain otherwise)
ulimit -n 8192
EOL
