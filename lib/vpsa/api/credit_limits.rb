module Vpsa
  module Api
    class CreditLimits < Client
  	  require_all 'vpsa/searcher/commercial', 'credit_limit_searcher'
  	  
  	  base_uri "https://www.vpsa.com.br/apps/api/limitescredito"

  	  def list(searcher = nil)
    		raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Commercial::CreditLimitSearcher)
    		
    		return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
    		return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
    	end
   	end
  end
end