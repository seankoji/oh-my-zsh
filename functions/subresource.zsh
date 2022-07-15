function subresource {
    echo "sha384-`curl -s $1 | openssl dgst -sha384 -binary | openssl base64 -A`" | pbcopy && echo "Copied subresource hash to clipboard\n`pbpaste`"
}
