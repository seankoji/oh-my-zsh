function web-test {
    if (($# == 0))
        then
            echo 'usage: web-test name repo'
            echo '  sumil-govil seankoji@bitbucket.org:foxsports/web-test-sumit-govil.git'
            return 1;
    fi

    echo 'Destroying folder /tmp/web-test'
    rm -rf /tmp/web-test

    echo `Cloning repo $2 to temp folder`
    git clone --depth=1 $2 /tmp/web-test

    echo 'Removing .git from temp folder'
    rm -rf /tmp/web-test/.git

    echo 'Emptying web-test repo folder'
    cd ~/repos/web-test
    find . -path ./.git -prune -o -exec rm -rf {} \; 2> /dev/null

    echo 'Copying files from temp to repo folder'
    mv /tmp/web-test/{.,}* ~/repos/web-test/

    echo `Committing branch $1`
    git checkout -b $1
    git add .

    echo "I'm gonna need sudo to -x from the files or your git diff will be off"
    sudo chmod -R -x * && sudo chmod -R +X *

    echo 'Ok commiting changes and pushing files now'
    git commit -m $1
    git push
}
