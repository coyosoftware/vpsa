require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Administrative
      class ThirdParty < Base
        attr_accessor :id, :ativo, :"dataAlteracao", :nome, :"nomeFantasia", :documento, :emails, :rg, :nascimento, :ie
      end
    end
  end
end