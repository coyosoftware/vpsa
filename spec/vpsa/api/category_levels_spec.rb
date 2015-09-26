require 'spec_helper'

RSpec.describe Vpsa::Api::CategoryLevels do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  let(:product_param) {{}}
  
  describe "list" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/niveis-categoria-produto/").to_return(:status => 200)
    end
    
    it "should issue a get to the category levels url" do
      expect(Vpsa::Api::CategoryLevels).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").category_levels.list
    end
    
  end
  
  
end