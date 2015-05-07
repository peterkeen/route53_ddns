# Route53 DDNS Updater

This is a tiny app you can run on Heroku to update a single DNS record with a simple call from curl.

## Installation

1. Click the Heroku button:

   [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

2. Fill in the params.

3. cron your curl

```
curl -u username:password -s https://your-heroku-app.herokuapp.com
```
