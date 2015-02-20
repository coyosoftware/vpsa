module Vpsa
  module Api
    class CreditLimits < Client
	  require_all 'vpsa/searcher/commercial', 'credit_limit_searcher'
	  require_all 'vpsa/entity/commercial', 'credit_limit'
	  
	  base_uri "https://www.vpsa.com.br/apps/api/limitescredito"

	  def list(searcher = nil)
		raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Commercial::CreditLimitSearcher)
		
		return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
		return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
  	  end

  	  def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header)) if data.is_a?(Hash)
        return parse_response(self.class.post("/", :body => build_body(data.as_parameter), :headers => header)) if data.is_a?(Vpsa::Entity::Commercial::CreditLimit)
        raise ArgumentError
      end
      alias :new :create
   	end
  end
end