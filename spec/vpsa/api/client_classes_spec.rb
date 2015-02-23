require 'spec_helper'

RSpec.describe Vpsa::Api::ClientClasses do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/classificacoes-clientes/").to_return(:status => 200)
    end
    
    it "should issue a get to the client classes url" do
      expect(Vpsa::Api::ClientClasses).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").client_classes.list()
    end
    
    it "should issue a get to the client classes url using the searcher" do
      searcher = Vpsa::Searcher::Operational::ClientClassSearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::ClientClasses).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").client_classes.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a ClientClassSearcher" do
      expect{Vpsa.new("abc").client_classes.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/classificacoes-clientes/5").to_return(:status => 200)
    end
    
    it "should issue a get to the client classes url" do
      expect(Vpsa::Api::ClientClasses).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").client_classes.find(5)
    end
  end
end