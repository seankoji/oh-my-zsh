function versioncommits {
    echo "Usage: versioncommits v8.5.0 v8.6.0";

    echo "\n\ngit log `git rev-parse $1`..$2 --grep='^MWL' --pretty=format:%s\n\n";

    git log `git rev-parse $1`..$2 --grep='^MWL' --pretty=format:%s | cat
}
