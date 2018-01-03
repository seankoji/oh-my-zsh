function v {
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
                git fetch && git checkout develop && git reset --hard origin/develop && npm version $1 && git checkout master && git reset --hard origin/master && git merge develop
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
