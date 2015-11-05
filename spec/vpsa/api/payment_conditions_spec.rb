require 'spec_helper'

RSpec.describe Vpsa::Api::PaymentConditions do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}

  describe "list" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/planos-pagamento/").to_return(:status => 200)
    end
    
    it "should issue a get to the product categories url" do
      expect(Vpsa::Api::PaymentConditions).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").payment_conditions.list
    end
    
  end
  
  
end