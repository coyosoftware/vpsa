require 'vpsa/searcher/base'

module Vpsa
  module Searcher
    module Commercial
      class CreditLimitSearcher < Base
      	attr_accessor :idClassificacaoCliente, :"idTerceiro", :endereco, :uf, :cidade, :email
      end
    end
  end
end