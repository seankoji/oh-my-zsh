# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias apache-start="sudo apachectl start"
alias apache-stop="sudo apachectl stop"

alias artifactory="curl -u sean.carey https://artifactory.foxsports.com.au/api/npm/auth"
alias bsync="browser-sync start --config bs-config.js"
alias ccat="pygmentize -g -O style=colorful"
alias chmod-number="stat -f \"%OLp\""   # get the chmod number for a file
alias composer='/usr/local/bin/composer.phar'
alias diedockerdie="docker kill $(docker ps -q); docker rm $(docker ps --filter=status=exited --filter=status=created -q); docker rmi $(docker images -a -q) -f"
alias gittag="git tag | sort -V"
alias grunty='grunt clean && grunt --force && grunt watcher'
alias hosts="sudo vim /etc/hosts"
alias ievms="curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS=\"EDGE\" REUSE_WIN7=\"no\" bash"
alias ip-to-clipboard="(ipconfig getifaddr en1 || ipconfig getifaddr en0) | pbcopy && echo \"Copied to clipboard:\" && (ipconfig getifaddr en1 || ipconfig getifaddr en0)"
alias npmraf="rimraf node_modules package-lock.json && npm install"
alias reload='exec zsh'
alias repos="cd /Users/sean.carey/repos"
alias ssh-clipboard="pbcopy < ~/.ssh/id_rsa.pub && echo \"Copied ~/.ssh/id_rsa.pub to clipboard: \n\" && cat ~/.ssh/id_rsa.pub"
alias ssh-reset="rm ~/.ssh/environment-*"
alias subl="open /Applications/Sublime\ Text.app"
alias version="node -p \"require('./package.json').version\""
alias ls="ls -a "

alias vip-up="composer update && composer install && docker-compose -f ~/repos/vip-quickstart-mirror/docker-compose.dev.yml up"
alias vip-down="docker-compose -f ~/repos/vip-quickstart-mirror/docker-compose.dev.yml down"

# disabling artifactory
alias npm-foxsports='npmrc default'
alias npm-public='npmrc public'
alias npm-globals="npm list --depth=0 -g && npm outdated -g"

# reload fonts when corrupted
alias fonts-repair='sudo atsutil databases -remove; atsutil server -shutdown'
alias chmod-remove-x-recursive='sudo chmod -R -x * && sudo chmod -R +X *'

#echo "AD Password: " && read AD_PASSWORD && echo "sean.carey:$AD_PASSWORD" && unset -v AD_PASSWORD

# [ -f ~/.oh-my-zsh/custom/functions/version.zsh ] && source ~/.oh-my-zsh/custom/functions/version.zsh
[ -f ~/.oh-my-zsh/custom/functions/web-test.zsh ] && source ~/.oh-my-zsh/custom/functions/web-test.zsh
[ -f ~/.oh-my-zsh/custom/functions/subresource.zsh ] && source ~/.oh-my-zsh/custom/functions/subresource.zsh
[ -f ~/.oh-my-zsh/custom/functions/giphy.zsh ] && source ~/.oh-my-zsh/custom/functions/giphy.zsh
[ -f ~/.oh-my-zsh/custom/functions/sourcemap.zsh ] && source ~/.oh-my-zsh/custom/functions/sourcemap.zsh
[ -f ~/.oh-my-zsh/custom/functions/change-node.zsh ] && source ~/.oh-my-zsh/custom/functions/change-node.zsh
[ -f ~/.oh-my-zsh/custom/functions/versioncommits.zsh ] && source ~/.oh-my-zsh/custom/functions/versioncommits.zsh
[ -f ~/.oh-my-zsh/custom/functions/fast-purge.zsh ] && source ~/.oh-my-zsh/custom/functions/fast-purge.zsh
[ -f ~/.oh-my-zsh/custom/functions/mobile-bypass.zsh ] && source ~/.oh-my-zsh/custom/functions/mobile-bypass.zsh
[ -f ~/.oh-my-zsh/custom/functions/mobile-unlink.zsh ] && source ~/.oh-my-zsh/custom/functions/mobile-unlink.zsh

# git config --global url."https://github.com".insteadOf git://github.com
