require "jetsetmeapi/version"

module Jetsetmeapi
  require 'httparty'

  AUTHPATH="https://api.jetsetme.com/authentication/request_token"
  CONFIRMPATH="https://api.jetsetme.com/authentication/confirm_token"
  DEVID=ENV["DEVID"]
  APPID=ENV["APPID"]
  HEADERS = {"X-DEVID" => DEVID, "X-APPID" => APPID, "Content-type" => "application/json"}

  def self.get_auth_token(msisdn)
    response = HTTParty.post(AUTHPATH, :headers => HEADERS, :body => {:msisdn => msisdn}.to_json)
    token = JSON.parse(response)["token"]
    error = JSON.parse(response)["error"] unless nil
    unless token == nil
      return token
    else
      return {:error => error}
    end
  end

  def self.get_auth_key(pin, token)
    response = HTTParty.post(CONFIRMPATH, :headers => HEADERS, :body => {:pin => pin, :token => token}.to_json)
    key = JSON.parse(response)["auth_key"]
  end
end
