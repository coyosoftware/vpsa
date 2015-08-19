require 'spec_helper'

RSpec.describe Vpsa::Api::Companies do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/empresas/").to_return(:status => 200)
    end
    
    it "should issue a get to the companies url" do
      expect(Vpsa::Api::Companies).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").companies.list()
    end
    
    it "should issue a get to the companies url using the searcher" do
      searcher = Vpsa::Searcher::Administrative::CompanySearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::Companies).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").companies.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a CompanySearcher" do
      expect{Vpsa.new("abc").companies.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/empresas/5").to_return(:status => 200)
    end
    
    it "should issue a get to the company url" do
      expect(Vpsa::Api::Companies).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").companies.find(5)
    end
  end
end
