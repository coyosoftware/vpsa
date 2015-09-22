require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class Product < Base
        attr_accessor :descricao, :classificacao, :origem, :fci, :metodoControle, :unidade, :custoReferencial, :codigoNcm
        attr_accessor :cnpjFornecedores, :especificacao, :codigoBarras, :codigoInterno, :codigoSistema, :estoqueMaximo
        attr_accessor :estoqueMinimo, :ativo, :descontoMaximo, :comissao, :preco
      end
    end
  end
end

# categorias: Lista com os dados das categorias que definem a estrutura mercadológica do produto. Deve ser informada uma categoria para cada nível de categoria cadastrado nível de categoria cadastrado.
# nome: Nome da Categoria (string) (obrigatório)
# nivel: Nome do Nível onde está localizada a categoria (string) (obrigatório)
