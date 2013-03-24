# Kataomoi

A tool for managing Twitter followers.

## Installation

Clone and bundle install.

```
$ git clone git://github.com/chocoby/kataomoi.git
$ cd kataomoi
$ bundle install --path .bundle
```

Register your application with Twitter.
[https://dev.twitter.com/apps/new](https://dev.twitter.com/apps/new)

Write OAuth settings to twitter.yml.

```
$ cp config/twitter.yml.sample config/twitter.yml
$ vim config/twitter.yml
```

config/twitter.yml:

```
consumer_key: YOUR_CONSUMER_KEY
consumer_secret: YOUR_CONSUMER_SECRET
oauth_token: YOUR_OAUTH_TOKEN
oauth_token_secret: YOUR_OAUTH_TOKEN_SECRET
```

## Usage

Fetch friends:

```
$ bundle exec rake friends
```

Fetch followers:

```
$ bundle exec rake followers
```

Get diffs:

```
$ bundle exec rake diff
```

Run web server:

```
$ bundle exec ruby kataomoi.rb
```

Access page:

[http://localhost:4567](http://localhost:4567)
