require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class Installment < Base
        attr_accessor :"bloquearClienteSemAnalise", :bloqueioAutomatico, :"mensagemBloqueio", :"permissaoValorExcedente"
        attr_accessor :"permiteLiberarBloqueioManual", :"permiteVenderSemAnalise"
        attr_accessor :"creditoMaximoCliente", :"valorCredMaximoCliente", :"limiteMensal", :limiteCreditoSobreRenda, :limiteSobreRenda
        attr_accessor :totalCredito
      end
    end
  end
end

