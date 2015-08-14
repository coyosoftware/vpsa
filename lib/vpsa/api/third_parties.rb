module Vpsa
  module Api
    class ThirdParties < Client
      require_all 'vpsa/searcher/administrative', 'third_party_searcher'
      require_all 'vpsa/entity/administrative', 'third_party', 'address', 'phone'
      require_all 'vpsa/entity/commercial', 'credit_limit'
      
      base_uri "#{Vpsa::API_ADDRESS}/terceiros"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Administrative::ThirdPartySearcher)
        
        return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
        return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
      end
      
      def find(id)
        return parse_response(self.class.get("/#{id}", :body => build_body,  :headers => header))
      end

      def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header)) if data.is_a?(Hash)
        return parse_response(self.class.post("/", :body => build_body(data.as_parameter), :headers => header)) if data.is_a?(Vpsa::Entity::Administrative::ThirdParty)
        raise ArgumentError
      end
      alias :new :create

      def credit_limit_information(id)
        return parse_response(self.class.get("/#{id}/limites_credito", :body => build_body,  :headers => header))
      end

      def update_credit_limit(id, data)
        return parse_response(self.class.put("/#{id}/limites_credito/#{id}", :body => build_body(data), :headers => header)) if data.is_a?(Hash)
        return parse_response(self.class.put("/#{id}/limites_credito/#{id}", :body => build_body(data.as_parameter), :headers => header)) if data.is_a?(Vpsa::Entity::Commercial::CreditLimit)
        raise ArgumentError
      end

      def block_credit_limit(id, justification)
        return parse_response(self.class.put("/#{id}/limites_credito/bloquear", :body => build_body({"motivo" => justification}),  :headers => header))
      end

      def unlock_credit_limit(id, justification)
        return parse_response(self.class.put("/#{id}/limites_credito/desbloquear", :body => build_body({"motivo" => justification}),  :headers => header))
      end

    end
  end
end