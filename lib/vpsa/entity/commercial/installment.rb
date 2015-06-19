require 'vpsa/entity/base'

module Vpsa
  module Entity
    module Commercial
      class Installment < Base
        attr_accessor :"bloquearClienteSemAnalise", :bloqueioAutomatico, :"mensagemBloqueio", :"permissaoValorExcedente"
        attr_accessor :"permiteLiberarBloqueioManual", :"permiteVenderSemAnalise"
        attr_accessor :"creditoMaximoCliente", :"valorCredMaximoCliente", :"limiteMensal", :limiteCreditoSobreRenda, :limiteSobreRenda
        attr_accessor :totalCredito
      end
    end
  end
end


# private boolean bloquearClienteSemAnalise;//
# private boolean bloqueioAutomatico;//
# private String mensagemBloqueio;//
# private boolean permissaoValorExcedente;//
#
# private boolean permiteLiberarBloqueioManual;//
# private boolean permiteVenderSemAnalise;//
#
# private BigDecimal creditoMaximoCliente;//
# private boolean valorCredMaximoCliente;//
#
#
# private String limiteMensal;//
#
# private boolean limiteCreditoSobreRenda;
# private BigDecimal limiteSobreRenda;

# private BigDecimal totalCredito;








# private boolean bloquearPorChequeDevolvido;
#
//