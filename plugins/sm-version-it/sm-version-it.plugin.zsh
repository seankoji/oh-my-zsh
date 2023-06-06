function versionit {
    if [ -f package.json ]; then
        echo `version`
    else
        print "No package.json detected in this directory"
        return 1;
    fi

    if (($# == 0))
        then
            echo 'Please specify npm version (patch, minor, major) or specific version'
            echo 'e.g. "v 1.12.1" or "v major"'
            return 1;
    fi

    echo "Updating version: `version` to version: $1"
    echo 'Going to run the following commands:'
    echo '```'
    echo "    npm version --no-git-tag-version $1"
    echo "    git checkout -b $1/v0.0.0"
    echo '    npm install --package-lock-only'
    echo '    git add .'
    echo '```'

    echo "Changes will remain staged and not pushed to remote. Continue? (y/n)"
    while true; do
        read doit
        case $doit in
            [Yy]* )
                npm version --no-git-tag-version $1 && git checkout -b `{node -pe "'patch/'+require('./package.json').version"}` && npm install --package-lock-only && git add .
                break;;
            [Nn]* )
                echo 'Aborting...';
                return 1;;
            * )
                echo 'Please choose y or n';;
        esac
    done
}
