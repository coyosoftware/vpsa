require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Financial
      class PaymentConditionSearcher < Base
        attr_accessor :desde, :ate, :alteradoApos, :descricao
      end
    end
  end
end
