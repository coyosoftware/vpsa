require 'spec_helper'

RSpec.describe Vpsa::Api::Installments do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "information" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/configuracao-credito/").to_return(:status => 200)
    end
    
    it "should issue a get to the installments url" do
      expect(Vpsa::Api::Installments).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").installments.information
    end
  end
  
  describe "configuration" do
    before(:each) do
      stub_request(:put, "#{Vpsa::API_ADDRESS}/configuracao-credito/").to_return(:status => 201)
    end
    
    let(:installment_param) {{}}
    
    it "should issue a post to the installments url" do
      expect(Vpsa::Api::Installments).to receive(:put).with("/", :body => installment_param.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").installments.configure( installment_param)
    end
  end
end
