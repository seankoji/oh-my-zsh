function mobile-unlink {
    if (($# == 0))
        then
            echo 'Please specify which email and phone to unlink'
            echo 'mobile-unlink sean.carey@foxsports.com.au 0411111111'
            return 1;
    fi

    curl -X POST \
        "https://auth0-phone-unlink.commerce.platform.streamotion-platform-nonprod.com.au/api/unlink?email=$1&phone=$2" \
        -H "accept: application/json" \
        --silent \
        | json_pp
}
