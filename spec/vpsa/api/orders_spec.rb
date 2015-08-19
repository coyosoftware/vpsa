require 'spec_helper'

RSpec.describe Vpsa::Api::Orders do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/pedidos/").to_return(:status => 200)
    end
    
    it "should issue a get to the orders url" do
      expect(Vpsa::Api::Orders).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").orders.list()
    end
    
    it "should issue a get to the orders url using the searcher" do
      searcher = Vpsa::Searcher::Operational::OrderSearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::Orders).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").orders.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a OrderSearcher" do
      expect{Vpsa.new("abc").orders.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/pedidos/5").to_return(:status => 200)
    end
    
    it "should issue a get to the order url" do
      expect(Vpsa::Api::Orders).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").orders.find(5)
    end
  end
end