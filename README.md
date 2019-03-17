![travis build](https://api.travis-ci.com/awinabi/rotodo.svg?branch=master)
## Introduction

Sample Roda Application for listing todos


Referenced from [this app](https://github.com/binarapps/slack-integrator), and [blog post to create a roda app](https://binarapps.com/blog/from-rails-to-roda-framework-a-quick-guide/).


## Technologies

- Roda - http://roda.jeremyevans.net
- Sequel - http://sequel.jeremyevans.net
- Postgres

## Setup

Setup .env file with values (some of them you need to obtain from slack integration - incoming/outcoming webhook):

```
DATABASE_URL="postgres://user:password@127.0.0.1:5432/db"
TEST_DATABASE_URL=
RACK_ENV='development'
SECRET_TOKEN=
```

Run bundle.
```
bundle install
```

Create and run migrations

```
be rake db:create
be rake db:migrate
```

Run the server with
```
rackup
```

## Tests
Prepare the database with the following:


```
be rake db:create RACK_ENV=test
be rake db:migrate RACK_ENV=test
```

Install chromedriver to run headless chrome.

```
brew cask install chromedriver
```

*For some reason* rbenv has the chromedriver binary from a gem; so uninstall it using `gem uninstall chromedriver-helper`.

Run chromedriver in the background- `chromedriver --silent &`, then run the specs.

```
be rspec spec
```

## Migrations

Migrations are generated using a rake task. <br />
To generate your migration invoke `rake generate:migration['Create events']`

## License

MIT
