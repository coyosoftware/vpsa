require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Financial
      class DefaultEntrySearcher < Base
        attr_accessor :entidades, :tipo
      end
    end
  end
end