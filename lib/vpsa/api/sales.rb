module Vpsa
  module Api
    class Sales < Client
      
      base_uri "#{Vpsa::API_ADDRESS}/externa/historico-vendas-terceiro"
      
      def sales_history(id)
        return parse_response(self.class.get("/buscar?terceiro=#{id}", :body => build_body,  :headers => header))
      end
      
      def sales_history_more_details(idTerceiro)
        return parse_response(self.class.get("/detalhar?terceiro=#{idTerceiro}", :body => build_body,  :headers => header))
      end
      
    end
  end
end