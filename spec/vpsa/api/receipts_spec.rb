require 'spec_helper'


RSpec.describe Vpsa::Api::Receipts do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/contas-receber/").to_return(:status => 200)
    end
    
    it "should issue a get to the receipts url" do
      expect(Vpsa::Api::Receipts).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").receipts.list()
    end
    
    it "should issue a get to the reciepts url using the searcher" do
      searcher = Vpsa::Searcher::Financial::ReceiptSearcher.new({:quantidade => 10, :inicio => 0, 
        :desde => '01-01-2015', :ate => '10-01-2015', :filtroData => 'dataVencimento', :alteradoApos => '01-01-2015 10:10:10'})

      expect(Vpsa::Api::Receipts).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original

      Vpsa.new("abc").receipts.list(searcher)
    end
   
    it "should raise ArgumentError if the parameter is not a ReceiptSearcher" do
      expect{Vpsa.new("abc").receipts.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "find" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/contas-receber/1").to_return(:status => 200)
    end
    
    it "should return an especific receipt" do
      expect(Vpsa::Api::Receipts).to receive(:get).with("/1", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      Vpsa.new("abc").receipts.find(1)
    end
    
  end
  
end
