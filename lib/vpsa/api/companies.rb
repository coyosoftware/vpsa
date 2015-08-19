module Vpsa
  module Api
    class Companies < Client
      require_all 'vpsa/searcher/administrative', 'company_searcher'
      
      base_uri "#{Vpsa::API_ADDRESS}/empresas"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Administrative::CompanySearcher)
        
        return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
        return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
      end
      
      def find(id)
        return parse_response(self.class.get("/#{id}", :body => build_body,  :headers => header))
      end
    end
  end
end