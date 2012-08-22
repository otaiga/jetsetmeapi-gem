require "jetsetmeapi/version"
require 'httparty'
require 'json'

module Jetsetmeapi

  AUTHPATH="https://api.jetsetme.com/authentication/request_token"
  CONFIRMPATH="https://api.jetsetme.com/authentication/confirm_token"
  DEVID=ENV["DEVID"]
  APPID=ENV["APPID"]
  HEADERS = {"X-DEVID" => DEVID, "X-APPID" => APPID, "Content-type" => "application/json"}

  def self.get_auth_token(msisdn)
    if load_parameters
      response = HTTParty.post(AUTHPATH, :headers => HEADERS, :body => {:msisdn => msisdn}.to_json)
      token = JSON.parse(response)["token"]
      error = JSON.parse(response)["error"] unless nil
      unless token == nil
        return token
      else
        return {:error => error}
      end
    else
      return {:error => "ERROR not all ENV variables found"}
    end
  end

  def self.get_auth_key(pin, token)
    if load_parameters
      response = HTTParty.post(CONFIRMPATH, :headers => HEADERS, :body => {:pin => pin, :token => token}.to_json)
      key = JSON.parse(response)["auth_key"]
    else
      return {:error => "ERROR not all ENV variables found"}
    end
  end

protected

  def self.load_parameters
    if DEVID || APPID == nil
      return false
    else
      return true
    end
  end
end
