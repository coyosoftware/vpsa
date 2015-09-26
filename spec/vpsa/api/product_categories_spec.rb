require 'spec_helper'

RSpec.describe Vpsa::Api::ProductCategories do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  let(:product_param) {{}}
  
  describe "list" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/categorias-produto/").to_return(:status => 200)
    end
    
    it "should issue a get to the product categories url" do
      expect(Vpsa::Api::ProductCategories).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").product_categories.list
    end
    
  end
  
  
end