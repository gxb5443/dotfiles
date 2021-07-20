# Set up homebrew
set -x PATH $PATH /usr/local/Cellar
set -x PATH $PATH /usr/local/opt/llvm/bin/

# Set up golang stuff
set -g -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec

set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $GOROOT/bin

# Set up Rust
set -x PATH $PATH ~/.cargo/bin

# Set up Flutter
set -x PATH $PATH ~/Documents/flutter/bin

# Set up Old Java
set -x PATH $PATH ~/Downloads/apache-maven-3.5.3/bin

set -x SLEDGE_BIN /Users/gianfranco.biondi/.sledge/bin
set -x PATH $PATH $SLEDGE_BIN

# Set Less preferences
set -x LESS '-R -C -M -I -j 10 -# 4'

fish_vi_key_bindings
set -U EDITOR nvim

# FZF Plugin Preferences
set -U FZF_COMPLETE 3
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_FIND_FILE_OPTS "--reverse --inline-info"
set -U FZF_FIND_FILE_COMMAND "rg --files"
set -U FZF_OPEN_COMMAND "rg --files"
set -U FZF_ENABLE_OPEN_PREVIEW 0
set -U FZF_PREVIEW_FILE_CMD "head -n 10"
set -U FZF_PREVIEW_DIR_CMD "exa -1"

# WMT Stuff
function set-wmt-proxy
    set -gx SSH_PROXY_COMMAND "ssh -N -D 8079 localhost"
    set -gx ALL_PROXY "proxy.wal-mart.com:9080"
    set -gx HTTP_PROXY "proxy.wal-mart.com:9080"
    set -gx HTTPS_PROXY "proxy.wal-mart.com:9080"
    set -gx GOPRIVATE "gecgithub01.walmart.com"
end

function unset-wmt-proxy
    set -e ALL_PROXY
    set -e HTTP_PROXY
    set -e HTTPS_PROXY
end




function proxy-wmt
	ps -A | grep -m1 "$SSH_PROXY_COMMAND" | awk '{print $1}' | xargs kill > /dev/null
	proxy-pac-proxy start \
		-u http://wmtpac.wal-mart.com/proxies/anycast-universal.pac \
		-U $USER \
		-P (security find-internet-password -s proxy-intlho.wal-mart.com -w)
end

function proxy-none
	# Create an ssh tunnel that looksl ike a socks proxy
	proxy-pac-proxy stop || true > /dev/null
	eval $SSH_PROXY_COMMAND &
end

#set -x HTTP_PROXY http://127.0.0.1:8079
#set -x HTTPS_PROXY http://127.0.0.1:8079
#set -x NO_PROXY localhost,127.0.0.1,(hostname)
#set -x http_proxy http://127.0.0.1:8079
#set -x https_proxy http://127.0.0.1:8079
#set -x no_proxy localhost,127.0.0.1,(hostname)
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
