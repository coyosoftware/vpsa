module Vpsa
  module Api
    class ClientClasses < Client
      require_all 'vpsa/searcher/operational', 'client_class_searcher'
      
      base_uri "https://www.vpsa.com.br/apps/api/classificacoes-clientes"

      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Operational::ClientClassSearcher)
        
        return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
        return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
      end
      
      def find(id)
        return parse_response(self.class.get("/#{id}", :body => build_body,  :headers => header))
      end
    end
  end
end