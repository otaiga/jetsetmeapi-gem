require 'spec_helper'

describe "Jetsetmeapi" do

  describe "Invalid variables" do
    
    it 'should return error string for get_auth_token' do
      Jetsetmeapi.get_auth_token(given_msisdn).should == {:error => "ERROR not all variables found"}
    end

    it 'should return error string for get_auth_key' do
      Jetsetmeapi.get_auth_key(given_pin, given_token).should == {:error => "ERROR not all variables found"}
    end
  end

  describe "Valid variables" do

    before(:each) do
      load_creds
      HTTParty.stub(:post).with(auth_url, :headers => headers, :body => {:msisdn => given_msisdn}.to_json).and_return({:token => given_token}.to_json)
      HTTParty.stub(:post).with(confirm_url, :headers => headers, :body => {:pin => given_pin, :token => given_token}.to_json).and_return({:auth_key => given_auth_key}.to_json)
    end
    
    it 'should return token for get_auth_token' do
      Jetsetmeapi.get_auth_token(given_msisdn).should == given_token
    end

    it 'should return auth_key for get_auth_key' do
      Jetsetmeapi.get_auth_key(given_pin, given_token).should == given_auth_key
    end
  end
  
end