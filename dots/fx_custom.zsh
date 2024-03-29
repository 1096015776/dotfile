# vpn setting
proxy_ip=$(cat /etc/resolv.conf|grep nameserver |awk -F 'nameserver ' '{print $2 }')
proxy_on ()
{
  echo 'start proxy'
  export https_proxy="http://${proxy_ip}:33210" http_proxy="http://${proxy_ip}:33210" all_proxy="socks5://${proxy_ip}:33211"
  echo $http_proxy
}
un_proxy(){
  unset https_proxy http_proxy all_proxy
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ra=ranger
alias lg=lazygit
alias vi=nvim
alias vim=nvim
alias tm="tmux attach -t code || tmux new -s code"
