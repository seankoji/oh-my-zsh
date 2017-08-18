# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias apache-start="sudo apachectl start"
alias apache-stop="sudo apachectl stop"

# TODO: get the below working... seems to break when writing credentials to curl arg?
# alias artifactory="echo \"AD Username: \" && read AD_LOGIN && echo \"AD Password: \" && read -s AD_PASSWORD && printf \"cache-min=86400\ncache-max=604800\nprogress=false\n\nregistry=https://artifactory.foxsports.com.au/api/npm/npm-remote/\n\" > ~/.npmrc && curl -u $AD_LOGIN:$AD_PASSWORD https://artifactory.foxsports.com.au/api/npm/auth >> ~/.npmrc && curl -u $AD_LOGIN:$AD_PASSWORD https://artifactory.foxsports.com.au/api/npm/npm-fsa/auth/fsa >> ~/.npmrc && echo $AD_LOGIN:$AD_PASSWORD && unset -v AD_LOGIN AD_PASSWORD"
alias artifactory="printf \"cache-min=86400\ncache-max=604800\nprogress=false\n\nregistry=https://artifactory.foxsports.com.au/api/npm/npm-remote/\n\" > ~/.npmrc && curl -u \"sean.carey\" https://artifactory.foxsports.com.au/api/npm/auth >> ~/.npmrc && curl -u \"sean.carey\" https://artifactory.foxsports.com.au/api/npm/npm-fsa/auth/fsa >> ~/.npmrc && cat ~/.npmrc"
alias bsync="browser-sync start --config bs-config.js"
alias ccat="pygmentize -g -O style=colorful"
alias chmod-number="stat -f \"%OLp\""   # get the chmod number for a file
alias composer='/usr/local/bin/composer.phar'
alias gittag="git tag | sort -V"
alias grunty='grunt clean && grunt --force && grunt watcher'
alias hosts="sudo vim /etc/hosts"
alias ievms="curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS=\"EDGE\" REUSE_WIN7=\"no\" bash"
alias ip-to-clipboard="(ipconfig getifaddr en1 || ipconfig getifaddr en0) | pbcopy && echo \"Copied to clipboard:\" && (ipconfig getifaddr en1 || ipconfig getifaddr en0)"
alias npmglobals="npm list --depth=0"
alias npmraf="rimraf node_modules && npm install"
alias reload='source ~/.zshrc'
alias repos="cd /Users/sean.carey/repos"
alias ssh-clipboard="pbcopy < ~/.ssh/id_rsa.pub && echo \"Copied ~/.ssh/id_rsa.pub to clipboard: \n\" && cat ~/.ssh/id_rsa.pub"
alias ssh-reset="rm ~/.ssh/environment-*"
alias subl="open /Applications/Sublime\ Text.app"
alias version="node -p \"require('./package.json').version\""

alias vip-up="docker-compose -f ~/repos/vip-quickstart-mirror/docker-compose.dev.yml up"
alias vip-down="docker-compose -f ~/repos/vip-quickstart-mirror/docker-compose.dev.yml down"

# disabling artifactory
alias npm-foxsports='npmrc default'
alias npm-public='npmrc public'

# reload fonts when corrupted
alias fonts-repair='sudo atsutil databases -remove; atsutil server -shutdown'
alias chmod-remove-x-recursive='sudo chmod -R -x * && sudo chmod -R +X *'

#echo "AD Password: " && read AD_PASSWORD && echo "sean.carey:$AD_PASSWORD" && unset -v AD_PASSWORD

[ -f ~/.oh-my-zsh/custom/functions/version.zsh ] && source ~/.oh-my-zsh/custom/functions/version.zsh

# git config --global url."https://github.com".insteadOf git://github.com
