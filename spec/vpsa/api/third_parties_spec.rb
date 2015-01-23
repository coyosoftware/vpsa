require 'spec_helper'

RSpec.describe Vpsa::Api::ThirdParties do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/terceiros/").to_return(:status => 200)
    end
    
    it "should issue a get to the third_parties url" do
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.list()
    end
    
    it "should issue a get to the third_parties url using the searcher" do
      searcher = Vpsa::Searcher::Administrative::ThirdPartySearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a ThirdPartySearcher" do
      expect{Vpsa.new("abc").third_parties.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/terceiros/5").to_return(:status => 200)
    end
    
    it "should issue a get to the third party url" do
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.find(5)
    end
  end
end
