require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class Item  < Base

        attr_accessor :idProduto, :quantidade, :valorDesconto, :valorUnitario

      end
    end
  end
end
