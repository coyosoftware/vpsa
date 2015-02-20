require 'spec_helper'

RSpec.describe Vpsa::Entity::Financial::Installment do
  describe "as_parameter" do
    let(:installment_as_parameter) {{"bloquearSemAnalise" => true, "bloqueio" => "MANUAL", "mensagemBloqueio" => "Seu crédito está bloqueado! :(",
      "liberarValorExcedente" => false, "liberarBloqueioManual" => true, "venderSemAnalise" => false, "creditoMaximoPorCliente" => true, 
      "valorCreditoMaximoPorCliente" => BigDecimal.new("1000.35"), "calculoValorCredito" => "LIMITE_SOBRE_RENDA", 
      "limiteMensalMaximo" => "SOBRE_TOTAL_DE_CREDITO"}}
      
    it "should return the installment as parameter" do
      installment = Vpsa::Entity::Financial::Installment.new({"bloquearSemAnalise" => true, "bloqueio" => "MANUAL", "mensagemBloqueio" => "Seu crédito está bloqueado! :(",
      "liberarValorExcedente" => false, "liberarBloqueioManual" => true, "venderSemAnalise" => false, "creditoMaximoPorCliente" => true, 
      "valorCreditoMaximoPorCliente" => BigDecimal.new("1000.35"), "calculoValorCredito" => "LIMITE_SOBRE_RENDA", 
      "limiteMensalMaximo" => "SOBRE_TOTAL_DE_CREDITO"})
      
      expect(installment.as_parameter).to eq(installment_as_parameter)
    end
  end
end
