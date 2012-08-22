require "jetsetmeapi/version"
require "jetsetmeapi/configuration"
require 'httparty'
require 'json'

module Jetsetmeapi

  AUTHPATH="https://api.jetsetme.com/authentication/request_token"
  CONFIRMPATH="https://api.jetsetme.com/authentication/confirm_token"

  def self.get_auth_token(msisdn)
    if load_parameters
      response = HTTParty.post(AUTHPATH, :headers => @HEADERS, :body => {:msisdn => msisdn}.to_json)
      token = JSON.parse(response)["token"]
      error = JSON.parse(response)["error"] unless nil
      unless token == nil
        return token
      else
        return {:error => error}
      end
    else
      return {:error => "ERROR not all variables found"}
    end
  end

  def self.get_auth_key(pin, token)
    if load_parameters
      response = HTTParty.post(CONFIRMPATH, :headers => @HEADERS, :body => {:pin => pin, :token => token}.to_json)
      key = JSON.parse(response)["auth_key"]
      error = JSON.parse(response)["error"] unless nil
      unless key == nil
        return key
      else
        return {:error => error}
      end
    else
      return {:error => "ERROR not all variables found"}
    end
  end

protected

  def self.load_parameters
    @DEVID = Jetsetmeapi::Config.dev_id
    @APPID = Jetsetmeapi::Config.app_id
    @HEADERS = {"X-DEVID" => @DEVID, "X-APPID" => @APPID, "Content-type" => "application/json"}

    if @DEVID && @APPID
      return true
    end
  end
end
