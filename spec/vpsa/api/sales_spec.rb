require 'spec_helper'

RSpec.describe Vpsa::Api::Sales do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "information" do
    
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/externa/historico-vendas-terceiro/buscar?terceiro=1").
        with(:body => "{\"token\":\"abc\"}",
             :headers => {'Accept'=>'application/json', 'Content-Type'=>'application/json'}).
        to_return(:status => 200, :body => "", :headers => {})
        
    end
    
    it "should issue a get to the sales url" do
      expect(Vpsa::Api::Sales).to receive(:get).with("/buscar?terceiro=1", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").sales.sales_history(1)
    end
  end
  
end
