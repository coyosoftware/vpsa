require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class CreditLimit < Base
        attr_accessor :"idTerceiro", :total
      end
    end
  end
end