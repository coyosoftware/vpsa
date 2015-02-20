require 'spec_helper'

RSpec.describe Vpsa::Api::Installments do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/crediarios/").to_return(:status => 200)
    end
    
    it "should issue a get to the installments url" do
      expect(Vpsa::Api::Installments).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").installments.list
    end
    
    it "should raise ArgumentError if the parameter is not a InstallmentSearcher" do
      expect{Vpsa.new("abc").installments.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "configuration" do
    before(:each) do
      stub_request(:post, "https://www.vpsa.com.br/apps/api/crediarios/").to_return(:status => 201)
    end
    
    let(:installment_param) {{}}
    
    it "should issue a post to the installments url" do
      expect(Vpsa::Api::Installments).to receive(:post).with("/", :body => installment_param.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").installments.configure(installment_param)
    end
  end
  
  describe "updating" do
    before(:each) do
      stub_request(:put, "https://www.vpsa.com.br/apps/api/crediarios/1").to_return(:status => 200)
    end
    
    let(:installment_param) {{}}
    
    it "should issue a put to the installments url" do
      expect(Vpsa::Api::Installments).to receive(:put).with("/1", :body => installment_param.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").installments.update(1, installment_param)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/crediarios/5").to_return(:status => 200)
    end
    
    it "should issue a get to the installment url" do
      expect(Vpsa::Api::Installments).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").installments.find(5)
    end
  end
end
