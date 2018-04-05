#!/bin/bash
# INSTALLS GO, THEN CONFIGURES AND BUILDS CADDY SERVER

HOMEDIR=/home/vagrant

apt-get install -y curl git mercurial make binutils bison gcc build-essential

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm

gvm install go1.9.5 --binary
gvm use go1.9.5 [--default]

echo "go get -u github.com/mholt/caddy/caddy"
go get -u github.com/mholt/caddy/caddy
echo "go get -u github.com/caddyserver/builds"
go get -u github.com/caddyserver/builds

echo "go get -u github.com/bruhs/caddy-service"
go get -u github.com/bruhs/caddy-service
echo "go get -u github.com/pyed/ipfilter"
go get -u github.com/pyed/ipfilter
echo "go get -u github.com/caddyserver/dnsproviders/namecheap"
go get -u github.com/caddyserver/dnsproviders/namecheap
echo "go get -u github.com/abiosoft/caddy-git"
go get -u github.com/abiosoft/caddy-git
echo "go get -u github.com/hacdias/caddy-hugo"
go get -u github.com/hacdias/caddy-hugo

cd $GOPATH/src/github.com/mholt/caddy/caddy/caddymain
cat > imports.txt <<EOL
    _ "github.com/bruhs/caddy-service"                 // run as service
    _ "github.com/pyed/ipfilter"                       // IP/geo-based rules
    _ "github.com/caddyserver/dnsproviders/namecheap"  // use namecheap DNS
    _ "github.com/abiosoft/caddy-git"                  // allow deployment via github
    _ "github.com/hacdias/caddy-hugo"                  // integration with hugo static cms
EOL

sed '/plugged in (imported)/r imports.txt' run.go

echo "building caddy..."
cd $GOPATH/src/github.com/mholt/caddy/caddy
go run build.go -goos=linux -goarch=amd64

echo "done."
mv caddy $GOPATH/bin

cat >> $HOMEDIR/.bashrc <<EOL
export PATH=$PATH:~/go/bin
# fix file descriptor limit (caddy will complain)
ulimit -n 8192
EOL

exit


