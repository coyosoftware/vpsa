module Vpsa
  module Api
    class ThirdParties < Client
      require_all 'vpsa/searcher/administrative', 'third_party_searcher'
      require_all 'vpsa/entity/administrative', 'third_party', 'address', 'phone'
      
      base_uri "https://www.vpsa.com.br/apps/api/terceiros"

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
        return parse_response(self.class.get("/#{id}/credit_limit", :body => build_body,  :headers => header))
      end
    end
  end
end