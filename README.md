# Jetsetmeapi

This is a gem to use with the jetsetme api. At the moment, it only allows auth requests.

***Note: *** This is NOT an offical Gem of JETSETME.

## Installation

Add this line to your application's Gemfile:

    gem 'jetsetmeapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jetsetmeapi

## Usage

  - Configuration:
    - Jetsetmeapi::Config.dev_id = "YOUR_DEV_ID"
    - Jetsetmeapi::Config.app_id = "YOUR_APP_ID"

Commands are as follows:

  - `Jetsetmeapi.get_auth_token(phone_number)`
    - Returns a token or error as `{:error => error}`
  - `Jetsetmeapi.get_auth_key(pin, token)` : gets an auth key.
    - Returns the auth_key
