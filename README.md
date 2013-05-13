# api.scrum.rb

[![Build Status](https://travis-ci.org/Koin/api.scrum.rb.png?branch=master)](https://travis-ci.org/Koin/api.scrum.rb) [![Code Climate](https://codeclimate.com/github/Koin/api.scrum.rb.png)](https://codeclimate.com/github/Koin/api.scrum.rb) [![Dependency Status](https://gemnasium.com/Koin/api.scrum.rb.png)](https://gemnasium.com/Koin/api.scrum.rb)

## About

It's a simple server which give you RESTful webservices essential for your agile and awesome team. Woot!

## Installation

You need Ruby 2.0, Postgres 9.2 and that's it!

How to install ruby in development? Use [rbenv](https://github.com/sstephenson/rbenv/).  
How to run this code in production? [Puma](http://puma.io/) and [Nginx](http://nginx.org/) are your best friends.

### Installing dependencies

First, install Bundler : `gem install bundler`  
Then, go to the root project and just type:
```sh
$ bundle
```

## API documentation

All you need is there: http://docs.apiscrumrb.apiary.io/  
You will find a full documentation and a server mock.

## You want to contribute?

* Fork the project.
* Create a topic branche.
* Make your feature addition or bug fix.
* Add tests for it, this is important.
* Commit, do not mess with history.
* Send me a pull request.

### How to run the tests?

```sh
$ bundle exec rspec
```

Need more humanity? Try `--format documentation` :-)

### How to update?

```sh
$ bundle update
```

Run the tests. Validates. Commit the `Gemfile` and the `Gemfile.lock`.

## License

Under the [WTFPL v2.0](http://en.wikipedia.org/wiki/WTFPL)
