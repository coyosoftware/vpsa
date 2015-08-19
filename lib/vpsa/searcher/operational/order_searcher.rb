require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Operational
      class OrderSearcher < Base
        attr_accessor :desde, :ate, :entidades, :"alteradoApos", :terceiro
      end
    end
  end
end