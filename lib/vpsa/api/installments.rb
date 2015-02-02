module Vpsa
  module Api
    class Installments < Client
      require_all 'vpsa/searcher/financial', 'installment_searcher'
      
      base_uri "https://www.vpsa.com.br/apps/api/crediarios"
      
      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Financial::InstallmentSearcher)
        
        return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
        return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
      end
      
      def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header))
      end
      
      def update(id, data)
        return parse_response(self.class.put("/#{id}", :body => build_body(data), :headers => header))
      end
      
      def find(id)
        return parse_response(self.class.get("/#{id}", :body => build_body,  :headers => header))
      end
    end
  end
end