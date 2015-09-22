require 'spec_helper'

RSpec.describe Vpsa::Api::Products do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  let(:product_param) {{}}
  
  describe "save" do
    before(:each) do
      stub_request(:post, "#{Vpsa::API_ADDRESS}/produtos/").to_return(:status => 201)

    end
    
    it "should issue a post to the products url" do
      expect(Vpsa::Api::Products).to receive(:post).with("/", :body => product_param.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").products.save(product_param)
    end
  end
  
  describe "update" do
    before(:each) do
      stub_request(:put, "#{Vpsa::API_ADDRESS}/produtos/1").to_return(:status => 200)
    end
    
    it "should issue a put to the installments url" do
      expect(Vpsa::Api::Products).to receive(:put).with("/1", :body => product_param.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").products.update(1, product_param)
    end
  end
end
