require 'spec_helper'

RSpec.describe Vpsa::Api::Sellers do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/representantes/").to_return(:status => 200)
    end
    
    it "should issue a get to the sellers url" do
      expect(Vpsa::Api::Sellers).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").sellers.list()
    end
    
    it "should issue a get to the sellers url using the searcher" do
      searcher = Vpsa::Searcher::Operational::SellerSearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::Sellers).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").sellers.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a SellerSearcher" do
      expect{Vpsa.new("abc").sellers.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/representantes/5").to_return(:status => 200)
    end
    
    it "should issue a get to the seller url" do
      expect(Vpsa::Api::Sellers).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").sellers.find(5)
    end
  end
end