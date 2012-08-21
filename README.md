# Jetsetmeapi

This is a gem to use with the jetsetme api. At the moment, it only allows auth requests.

## Installation

Add this line to your application's Gemfile:

    gem 'jetsetmeapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jetsetmeapi

## Usage

Commands are as follows:

  - `Jetsetmeapi.get_auth_token(phone_number)`
    - Returns a token or error as `{:error => error}`
  - `Jetsetmeapi.get_auth_key(pin, token)` : gets an auth key.
    - Returns the auth_key

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
