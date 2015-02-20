require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class Installment < Base
        attr_accessor :"bloquearSemAnalise", :bloqueio, :"mensagemBloqueio", :"liberarValorExcedente", :"liberarBloqueioManual", :"venderSemAnalise"
        attr_accessor :"creditoMaximoPorCliente", :"valorCreditoMaximoPorCliente", :"calculoValorCredito", :"limiteMensalMaximo"
      end
    end
  end
end