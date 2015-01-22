require 'spec_helper'

RSpec.describe Vpsa::Api::ThirdParties do
  describe "listing" do
    let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
    
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/terceiros/").to_return(:status => 200)
    end
    
    it "should get to the third_parties url" do
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.list()
    end
  end
end
