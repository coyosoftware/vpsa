require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class Order < Base

        attr_accessor :data, :horario, :idEntidade, :idPlanoPagamento, :idRepresentante, :idTerceiro,
                      :observacao, :valorFrete, :valorOutros, :valorSeguro, :vendaConsumidorFinal, :itens

      end
    end
  end
end
