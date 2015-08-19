require 'spec_helper'

RSpec.describe Vpsa::Api::SalesHistory do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "information" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/externa/historico-vendas-terceiro/buscar?terceiro=1").
        with(:body => "{\"token\":\"abc\"}",
             :headers => {'Accept'=>'application/json', 'Content-Type'=>'application/json'}).
        to_return(:status => 200, :body => "", :headers => {})
    end
    
    it "should issue a get to the find url" do
      expect(Vpsa::Api::SalesHistory).to receive(:get).with("/buscar?terceiro=1", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").sales_history.find(1)
    end
  end

  describe "more details" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/externa/historico-vendas-terceiro/detalhar?terceiro=1").
        with(:body => "{\"token\":\"abc\"}",
             :headers => {'Accept'=>'application/json', 'Content-Type'=>'application/json'}).
        to_return(:status => 200, :body => "", :headers => {})
    end
    
    it "should issue a get to the more details url" do
      expect(Vpsa::Api::SalesHistory).to receive(:get).with("/detalhar?terceiro=1", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").sales_history.more_details(1)
    end
  end
end