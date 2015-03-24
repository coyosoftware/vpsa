module Vpsa
  module Api
    class Installments < Client
      require_all 'vpsa/entity/commercial', 'installment'
      
      base_uri "#{Vpsa::API_ADDRESS}/configuracao-credito"
          
      def configure(data)
        #return parse_response(self.class.put("/", :body => build_body(data), :headers => header))
        return parse_response(self.class.put("/", :body => data.to_json, :headers => header))
      end
      
      def information
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end
    end
  end
end