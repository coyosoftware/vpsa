require 'spec_helper'

RSpec.describe Vpsa::Api::DefaultEntries do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/lancamentos-padroes/").to_return(:status => 200)
    end
    
    it "should issue a get to the default_entries url" do
      expect(Vpsa::Api::DefaultEntries).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").default_entries.list()
    end
    
    it "should issue a get to the default_entries url using the searcher" do
      searcher = Vpsa::Searcher::Financial::DefaultEntrySearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::DefaultEntries).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").default_entries.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a DefaultEntrySearcher" do
      expect{Vpsa.new("abc").default_entries.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/lancamentos-padroes/5").to_return(:status => 200)
    end
    
    it "should issue a get to the default entry url" do
      expect(Vpsa::Api::DefaultEntries).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").default_entries.find(5)
    end
  end
end
