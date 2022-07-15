function fast-purge {
    if (($# == 0))
        then
            echo 'Please specify which URL to fast purge cache for'
            echo 'fast-purge https://kayosports.com.au/some-file.js'
            return 1;
    fi

    curl -X POST \
        https://fsdevfe01.foxsports.com.au/akamai/fast-purge \
        -H 'Content-Type: application/json' \
        -H 'access-header: service-developer' \
        -d "{\"account\":\"streamotion\", \"files\":[\"$1\"]}" \
        --silent \
        | json_pp
}
