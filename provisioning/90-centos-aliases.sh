#!/bash/bin

cat >> home/vagrant/.bashrc << EOF
# user aliases
alias ll='ls -la'
alias editalias='vim ~/.bashrc'
alias sourcealias='source ~/.bashrc'
alias listalias='cat ~/.bashrc'
EOF
