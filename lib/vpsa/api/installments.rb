module Vpsa
  module Api
    class Installments < Client
      require_all 'vpsa/entity/commercial', 'installment'
      
      base_uri "https://www.vpsa.com.br/apps/api/crediarios"
          
      def configure(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header))
      end
      
      def information
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end
    end
  end
end