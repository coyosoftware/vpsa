require 'spec_helper'

RSpec.describe Vpsa::Api::Provisions do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "creation" do
    before(:each) do
      stub_request(:post, "#{Vpsa::API_ADDRESS}/provisoes-contas/").to_return(:status => 201)
    end
    
    let(:provision_param) {{:"idLancamentoPadrao" => 3, :"idEntidade" => 1, :"idTerceiro" => 2, :data => "25-02-2019", :valor => "123.50", :historico => "histórico"}}
    
    it "should issue a post to the provisions url" do
      expect(Vpsa::Api::Provisions).to receive(:post).with("/", :body => provision_param.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").provisions.create(provision_param)
    end
  end
end
