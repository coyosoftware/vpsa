require 'spec_helper'

RSpec.describe Vpsa::Api::CreditLimits do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/limitescredito/").to_return(:status => 200)
    end
    
    it "should issue a get to the credit_limits url" do
      expect(Vpsa::Api::CreditLimits).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").credit_limits.list()
    end
    
    it "should issue a get to the credit_limits url using the searcher" do
      searcher = Vpsa::Searcher::Commercial::CreditLimitSearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::CreditLimits).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").credit_limits.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a CreditLimitSearcher" do
      expect{Vpsa.new("abc").credit_limits.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
end
