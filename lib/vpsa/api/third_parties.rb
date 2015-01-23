module Vpsa
  module Api
    class ThirdParties < Client
      require_all 'vpsa/entity/administrative', 'third_party'
      require_all 'vpsa/searcher/administrative', 'third_party_searcher'
      
      base_uri "https://www.vpsa.com.br/apps/api/terceiros"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Administrative::ThirdPartySearcher)
        
        return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
        return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
      end
      
      def find(id)
        return parse_response(self.class.get("/#{id}", :body => build_body,  :headers => header))
      end
    end
  end
end