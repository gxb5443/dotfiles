# set the workspace path
set -g -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec


# add the go bin path to be able to execute our programs
#set -x PATH $PATH /usr/local/Cellar/go/bin $GOPATH/bin
#set -x PATH $PATH /usr/local/Cellar/go/bin $GOPATH/bin

#set -x PATH $PATH /usr/local/Cellar
#set -x PATH
set -x PATH $PATH /usr/local/Cellar
# add the go bin path to be able to execute our programs
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $GOROOT/bin


fish_vi_key_bindings

. ~/perl5/perlbrew/etc/perlbrew.fish
