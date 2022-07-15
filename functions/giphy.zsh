function giphy() {
    curl --silent "https://api.giphy.com/v1/gifs/search?api_key=SZbMIW8u9baDt2joBi5qGI9ef96QGxFK&limit=1&offset=0&rating=&lang=en&q=$1" | node -p "JSON.parse(require('fs').readFileSync('/dev/stdin')).data[0].images.downsized_large.url" | pbcopy | open -a Slack
}
