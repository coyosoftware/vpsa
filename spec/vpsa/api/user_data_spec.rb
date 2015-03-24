require 'spec_helper'

RSpec.describe Vpsa::Api::UserData do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/dados-login/").to_return(:status => 200)
    end
    
    it "should issue a get to the dados-login url" do
      expect(Vpsa::Api::UserData).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").user_data.get
    end
  end
end
