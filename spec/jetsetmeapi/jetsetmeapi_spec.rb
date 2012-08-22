require 'spec_helper'

describe "Jetsetmeapi" do

  describe "Invalid ENV variables" do
    
    it 'should return error string for get_auth_token' do
      Jetsetmeapi.get_auth_token(given_msisdn).should == {:error => "ERROR not all ENV variables found"}
    end

    it 'should return error string for get_auth_key' do
      Jetsetmeapi.get_auth_key(given_pin, given_token).should == {:error => "ERROR not all ENV variables found"}
    end
  end
end