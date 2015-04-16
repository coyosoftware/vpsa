module Vpsa
  module Api
    class Receipts < Client
  	  require_all 'vpsa/searcher/financial', 'receipt_searcher'
  	  
  	  base_uri "#{Vpsa::API_ADDRESS}/contas-receber"

  	  def list(searcher = nil)
    		raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Financial::ReceiptSearcher)
    		
    		return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
    		return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
        
    	end
   	end
  end
end