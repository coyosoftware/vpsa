require 'spec_helper'

RSpec.describe Vpsa::Api::CreditLimits do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "https://www.vpsa.com.br/apps/api/limitescredito/").to_return(:status => 200)
    end
    
    it "should issue a get to the credit_limits url" do
      expect(Vpsa::Api::CreditLimits).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").credit_limits.list()
    end
    
    it "should issue a get to the credit_limits url using the searcher" do
      searcher = Vpsa::Searcher::Commercial::CreditLimitSearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::CreditLimits).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").credit_limits.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a CreditLimitSearcher" do
      expect{Vpsa.new("abc").credit_limits.list(Array.new)}.to raise_error(ArgumentError)
    end
  end

  describe "creating" do
    let(:credit_limit_params) {{"idTerceiro" => "5", "total" => BigDecimal.new("23.45"), :token => "abc"}}
    
    before(:each) do
      @credit_limit = Vpsa::Entity::Commercial::CreditLimit.new({"idTerceiro" => "5", "total" => BigDecimal.new("23.45")})
      
      stub_request(:post, "https://www.vpsa.com.br/apps/api/limitescredito/").to_return(:status => 201)
    end
    
    describe "with raw parameters" do
      it "should post to the credit limits url" do
        expect(Vpsa::Api::CreditLimits).to receive(:post).with("/", :body => credit_limit_params.to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").credit_limits.create({"idTerceiro" => "5", "total" => BigDecimal.new("23.45")})
      end
    end
    
    describe "with entity parameter" do
      it "should post to the credit limits url" do
        expect(Vpsa::Api::CreditLimits).to receive(:post).with("/", :body => @credit_limit.as_parameter.merge!(:token => "abc").to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").credit_limits.create(@credit_limit)
      end
    end
    
    describe "with invalid parameter" do
      it "should raise ArgumentError when passing neither a Hash nor a CreditLimit" do
        expect{Vpsa.new("abc").credit_limits.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end
end
