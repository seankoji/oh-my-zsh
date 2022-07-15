function bypass-mobile {
    if (($# == 0))
        then
            echo 'Please specify which email address to bypass mobile validation for'
            echo 'bypass-mobile sean.carey@foxsports.com.au'
            return 1;
    fi

    curl -X POST \
        http://fsdevfe01:8081/kayo/auth0/e2e-user-bypass-mobile \
        -H 'Content-Type: application/json' \
        -H 'access-header: service-developer' \
        -d "{\"emailAddress\":\"$1\"}" \
        --silent \
        | json_pp
}
