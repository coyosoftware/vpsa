require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Financial
      class PaymentConditionSearcher < Base
        attr_accessor :inicio, :quantidade, :alteradoApos, :documentoTerceiro
      end
    end
  end
end
