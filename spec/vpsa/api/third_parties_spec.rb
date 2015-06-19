require 'spec_helper'

RSpec.describe Vpsa::Api::ThirdParties do
  let(:header) {{"Content-Type" => "application/json", "Accept" => "application/json"}}
  
  describe "listing" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/terceiros/").to_return(:status => 200)
    end
    
    it "should issue a get to the third_parties url" do
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.list()
    end
    
    it "should issue a get to the third_parties url using the searcher" do
      searcher = Vpsa::Searcher::Administrative::ThirdPartySearcher.new({:quantidade => 10, :inicio => 0})
      
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/", :body => searcher.as_parameter.merge!({:token => "abc"}).to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.list(searcher)
    end
    
    it "should raise ArgumentError if the parameter is not a ThirdPartySearcher" do
      expect{Vpsa.new("abc").third_parties.list(Array.new)}.to raise_error(ArgumentError)
    end
  end
  
  describe "finding" do
    before(:each) do
      stub_request(:get, "#{Vpsa::API_ADDRESS}/terceiros/5").to_return(:status => 200)
    end
    
    it "should issue a get to the third party url" do
      expect(Vpsa::Api::ThirdParties).to receive(:get).with("/5", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
      
      Vpsa.new("abc").third_parties.find(5)
    end
  end
  
  describe "creating" do
    let(:third_party_params) {{:nome => "Nome do terceiro", :documento => "023.168.132-00", :token => "abc"}}
    
    before(:each) do
      @third_party = Vpsa::Entity::Administrative::ThirdParty.new({"id" => "5", "nome" => "Nome do terceiro", "documento" => "023.168.132-00",
        "rg" => "42.943.412-1", "dataNascimento" => "12-08-1980"})
      
      @third_party.emails = ["email@email.com", "other@email.com"]
      
      @third_party.enderecos << Vpsa::Entity::Administrative::Address.new({"tipo" => "AVENIDA", "logradouro" => "9 de Julho", "numero" => "900", "bairro" => "CENTRO",
        "complemento" => "APTO 1", "cep" => "12000111", "codigoIBGECidade" => "3554102", "tipoEndereco" => "ENDERECO_COBRANCA"})
      @third_party.enderecos << Vpsa::Entity::Administrative::Address.new({"tipo" => "RUA", "logradouro" => "15 de Novembro", "numero" => "1020", "bairro" => "JD. MARIA",
        "complemento" => "APTO 1", "cep" => "12600123", "codigoIBGECidade" => "3554102", "tipoEndereco" => "ENDERECO_SEDE"})
        
      @third_party.telefones << Vpsa::Entity::Administrative::Phone.new({"ddi" => "55", "ddd" => "12", "numero" => "12341234"})
      @third_party.telefones << Vpsa::Entity::Administrative::Phone.new({"ddi" => "0", "ddd" => "31", "numero" => "12340000", "ramal" => "1234"})
      
      @third_party.classes = ["SOCIO_PROPRIETARIO", "FUNCIONARIO"]
      
      stub_request(:post, "#{Vpsa::API_ADDRESS}/terceiros/").to_return(:status => 201)
    end
    
    describe "with raw parameters" do
      it "should post to the third party url" do
        expect(Vpsa::Api::ThirdParties).to receive(:post).with("/", :body => third_party_params.to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").third_parties.create({:nome => "Nome do terceiro", :documento => "023.168.132-00"})
      end
    end
    
    describe "with entity parameter" do
      it "should post to the third party url" do
        expect(Vpsa::Api::ThirdParties).to receive(:post).with("/", :body => @third_party.as_parameter.merge!(:token => "abc").to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").third_parties.create(@third_party)
      end
    end
    
    describe "with invalid parameter" do
      it "should raise ArgumentError when passing neither a Hash nor a ThirdParty" do
        expect{Vpsa.new("abc").third_parties.create(Array.new)}.to raise_error(ArgumentError)
      end
    end
  end

  describe "credit limit" do
    context "information" do
      before(:each) do
        stub_request(:get, "#{Vpsa::API_ADDRESS}/terceiros/5/limites_credito").to_return(:status => 200)
      end

      it "should issue a get to the third party credit limit url" do
        expect(Vpsa::Api::ThirdParties).to receive(:get).with("/5/limites_credito", :body => {:token => "abc"}.to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").third_parties.credit_limit_information(5)
      end
    end

    context "modification" do
      let(:credit_limit_params) {{"total" => BigDecimal.new("154.32"), :token => "abc"}}

      before(:each) do
        @credit_limit = Vpsa::Entity::Commercial::CreditLimit.new({"total" => BigDecimal.new("154.32")})
        
        stub_request(:put, "#{Vpsa::API_ADDRESS}/terceiros/5/limites_credito/5").to_return(:status => 200)
      end
      
      describe "with raw parameters" do
        it "should put to the third party credit limit url" do
          expect(Vpsa::Api::ThirdParties).to receive(:put).with("/5/limites_credito/5", :body => credit_limit_params.to_json, :headers => header).and_call_original
          
          Vpsa.new("abc").third_parties.update_credit_limit(5, {"total" => BigDecimal.new("154.32")})
        end
      end
      
      describe "with entity parameter" do
        it "should put to the third party credit limit url" do
          expect(Vpsa::Api::ThirdParties).to receive(:put).with("/5/limites_credito/5", :body => @credit_limit.as_parameter.merge!(:token => "abc").to_json, :headers => header).and_call_original
          
          Vpsa.new("abc").third_parties.update_credit_limit(5, @credit_limit)
        end
      end
      
      describe "with invalid parameter" do
        it "should raise ArgumentError when passing neither a Hash nor a CreditLimit" do
          expect{Vpsa.new("abc").third_parties.update_credit_limit(5, Array.new)}.to raise_error(ArgumentError)
        end
      end
    end

    context "blocking" do
      let(:credit_limit_block_params) {{"justificativa" => "Cliente caloteiro", :token => "abc"}}

      before(:each) do
        stub_request(:put, "#{Vpsa::API_ADDRESS}/terceiros/5/limites_credito/bloquear").to_return(:status => 200)
      end

      it "should put to the third party credit block url" do
        expect(Vpsa::Api::ThirdParties).to receive(:put).with("/5/limites_credito/bloquear", :body => credit_limit_block_params.to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").third_parties.block_credit_limit(5, "Cliente caloteiro")
      end
    end

    context "unlocking" do
      let(:credit_limit_unlock_params) {{"justificativa" => "Cliente pagou", :token => "abc"}}

      before(:each) do
        stub_request(:put, "#{Vpsa::API_ADDRESS}/terceiros/5/limites_credito/desbloquear").to_return(:status => 200)
      end

      it "should put to the third party credit unlock url" do
        expect(Vpsa::Api::ThirdParties).to receive(:put).with("/5/limites_credito/desbloquear", :body => credit_limit_unlock_params.to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").third_parties.unlock_credit_limit(5, "Cliente pagou")
      end
    end

    context "history" do
      let(:history_params) {{"desde" => Date.parse("01/01/2015"), "ate" => Date.parse("11/01/2015"), :token => "abc"}}

      before(:each) do
        stub_request(:get, "#{Vpsa::API_ADDRESS}/terceiros/5/limites_credito/historico").to_return(:status => 200)
      end

      it "should issue a get to the third party credit history url" do
        expect(Vpsa::Api::ThirdParties).to receive(:get).with("/5/limites_credito/historico", :body => history_params.to_json, :headers => header).and_call_original
        
        Vpsa.new("abc").third_parties.credit_limit_history(5, Date.parse("01/01/2015"), Date.parse("11/01/2015"))
      end
    end
  end
end