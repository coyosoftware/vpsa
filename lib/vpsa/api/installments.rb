module Vpsa
  module Api
    class Installments < Client
      require_all 'vpsa/entity/commercial', 'installment'
      
      base_uri "#{Vpsa::API_ADDRESS}/configuracao-credito"
          
      def configure(id, data)
        return parse_response(self.class.put("/#{id}", :body => build_body(data), :headers => header))
      end
      
      def information
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end
    end
  end
end