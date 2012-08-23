require 'spec_helper'

describe "Jetsetmeapi" do

  describe "Invalid variables" do
    
    it 'should return error string for get_auth_token' do
      Jetsetmeapi.get_auth_token(given_msisdn).should == {:error => "ERROR not all variables found"}
    end

    it 'should return error string for get_auth_key' do
      Jetsetmeapi.get_auth_key(given_pin, given_token).should == {:error => "ERROR not all variables found"}
    end

    it 'should return error string for get_customer_status' do
      Jetsetmeapi.get_customer_status(given_auth_key).should == {:error => "ERROR not all variables found"}
    end
  end

  describe "Valid variables and no server error" do

    before(:each) do
      load_creds
      mock_response = mock("http_fake")
      mock_response.stub(:body).and_return("true")
      HTTParty.stub(:post).with(auth_url, :headers => headers, :body => {:msisdn => given_msisdn}.to_json).and_return({:token => given_token}.to_json)
      HTTParty.stub(:post).with(confirm_url, :headers => headers, :body => {:pin => given_pin, :token => given_token}.to_json).and_return({:auth_key => given_auth_key}.to_json)
      HTTParty.stub(:post).with(customer_url, :headers => headers, :body => {:auth_key => given_auth_key}.to_json).and_return(mock_response)

    end
    
    it 'should return token for get_auth_token' do
      Jetsetmeapi.get_auth_token(given_msisdn).should == given_token
    end

    it 'should return auth_key for get_auth_key' do
      Jetsetmeapi.get_auth_key(given_pin, given_token).should == given_auth_key
    end

    it 'should return roaming event for get_customer_status' do
      Jetsetmeapi.get_customer_status(given_auth_key).should == "true"
    end
  end

  describe "Valid variables and with server error" do

    before(:each) do
      load_creds
      mock_response = mock("http_fake")
      mock_response.stub(:body).and_return({:error => "bad auth key"})
      HTTParty.stub(:post).with(auth_url, :headers => headers, :body => {:msisdn => given_msisdn}.to_json).and_return({:error => "invalid MSISDN"}.to_json)
      HTTParty.stub(:post).with(confirm_url, :headers => headers, :body => {:pin => given_pin, :token => given_token}.to_json).and_return({:error => "bad request, not authorised token"}.to_json)
      HTTParty.stub(:post).with(customer_url, :headers => headers, :body => {:auth_key => given_auth_key}.to_json).and_return(mock_response)

    end
    
    it 'should return token for get_auth_token' do
      Jetsetmeapi.get_auth_token(given_msisdn).should == {:error => "invalid MSISDN"}
    end

    it 'should return auth_key for get_auth_key' do
      Jetsetmeapi.get_auth_key(given_pin, given_token).should == {:error => "bad request, not authorised token"}
    end

    it 'should return roaming event for get_customer_status' do
      Jetsetmeapi.get_customer_status(given_auth_key).should == {:error => "bad auth key"}
    end
  end
  
end