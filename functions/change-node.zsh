function change-node {
    if (($# == 0))
        then
            echo 'Please specify node version to use'
            echo 'e.g. change-node 12'
            return 1;
    fi

    echo "Current node version: `node --version`";
    echo "Current npm version: `npm --version`";

    nvm install $1;
    nvm alias default $1;
    npm install -g npm;
    npm install -g rimraf@latest stylelint@latest eslint@latest eslint-plugin-compat@latest eslint-plugin-filenames@latest eslint-plugin-import@latest eslint-plugin-jsdoc@latest eslint-plugin-jsx-a11y@latest eslint-plugin-react@latest bolt@latest;

    echo "New node version: `node --version`";
    echo "New npm version: `npm --version`";
}
