require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Commercial
      class CreditLimitSearcher < Base
      	attr_accessor :classes, :"idTerceiro", :endereco, :uf, :cidade, :email, :"idClassificacaoCliente"
      end
    end
  end
end
