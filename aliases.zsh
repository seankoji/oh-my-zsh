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
alias ssh-reset="rm ~/.ssh/environment-IT030850"
alias subl="open /Applications/Sublime\ Text.app"
alias version="node -p \"require('./package.json').version\""

alias vip-up="docker-compose -f ~/repos/vip-quickstart-mirror/docker-compose.dev.yml up"
alias vip-down="docker-compose -f ~/repos/vip-quickstart-mirror/docker-compose.dev.yml down"

# disabling artifactory
alias npm-foxsports='npm config set registry https://artifactory.foxsports.com.au/api/npm/npm-remote/'
alias npm-public='npm config set registry https://registry.npmjs.org'

# reload fonts when corrupted
alias fonts-repair='sudo atsutil databases -remove; atsutil server -shutdown'
alias chmod-remove-x-recursive='sudo chmod -R -x * && sudo chmod -R +X *'

# personal
alias ssh-mediatemple='ssh root@bgsh-qwst.accessdomain.com'
alias ssh-heymamashey="ssh wordpress@ec2-52-62-37-136.ap-southeast-2.compute.amazonaws.com"

#echo "AD Password: " && read AD_PASSWORD && echo "sean.carey:$AD_PASSWORD" && unset -v AD_PASSWORD

# WIP
function v {
    if (($# == 0))
        then
            echo 'Please specify npm version (patch, minor, major) or specific version'
            echo 'e.g. "v 1.12.1" or "v major"'
            return 1;
    fi

    echo "Updating version: `version` to version: $1"
    echo 'Going to run the following commands:'
    echo '```'
    echo '    git fetch'
    echo '    git checkout develop && git reset --hard origin/develop'
    echo "    npm version $1"
    echo '    git checkout master && git reset --hard origin/master'
    echo '    git merge develop'
    echo '```'

    echo "I'll ask again before pushing anything to remote. Go ahead and do it? (y/n)"
    while true; do
        read doit
        case $doit in
            [Yy]* )
                echo "git fetch && git checkout develop && git reset --hard origin/develop && npm version $1 && git checkout master && git reset --hard origin/master && git merge develop"
                break;;
            [Nn]* )
                echo 'Aborting...';
                return 1;;
            * )
                echo 'Please choose y or n';;
        esac
    done

    echo "New version: `version` tagged. Push develop & master to remote? (y/n)"
    while true; do
        read yn
        case $yn in
            [Yy]* )
                echo 'git push --tags && git push && git checkout develop && git push';
                break;;
            [Nn]* )
                echo 'Trying to reset changes on local master/develop';
                echo 'git co develop && git tag -l | xargs git tag -d && git fetch --tags'; # reset tags on develop
                echo 'git co master && git reset --hard origin/master && git tag -l | xargs git tag -d && git fetch --tags'; # reset master to origin and reset tags
                return 1;;
            * )
                echo 'Please choose y or n';;
        esac
    done
}