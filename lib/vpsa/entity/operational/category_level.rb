require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Operational
      class CategoryLevel < Base
        attr_accessor :id, :ativo, :dataAlteracao, :nome, :nivel, :compoeReferenciaBase, :idNivelCategoriaProdutoPai
      end
    end
  end
end
