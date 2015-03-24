require 'spec_helper'

RSpec.describe Vpsa::Api::Entities do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/entidades/").to_return(:status => 200)
    end
    
    it "should issue a get to the entities url" do
      expect(Vpsa::Api::Entities).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").entities.list()
    end
    
    it "should issue a get to the entities url using the searcher" do
      searcher = Vpsa::Searcher::Administrative::EntitySearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::Entities).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").entities.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a EntitySearcher" do
      expect{Vpsa.new("abc").entities.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/entidades/5").to_return(:status => 200)
    end
    
    it "should issue a get to the entity url" do
      expect(Vpsa::Api::Entities).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").entities.find(5)
    end
  end
end
