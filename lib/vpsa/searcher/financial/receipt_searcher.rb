require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Financial
      class ReceiptSearcher < Base
        attr_accessor :desde, :ate, :filtroData, :alteradoApos
      end
    end
  end
end