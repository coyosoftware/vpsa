require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Operational
      class ProductCategory < Base
         attr_accessor :id, :ativo, :dataAlteracao, :nome, :origem, :unidade, :metodoControle, :classificacao, :categoriaPai, :nivel
      end
    end
  end
end
