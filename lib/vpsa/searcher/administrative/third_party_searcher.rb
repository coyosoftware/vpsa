require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Administrative
      class ThirdPartySearcher < Base
        attr_accessor :classes, :"alteradoApos", :documento
      end
    end
  end
end