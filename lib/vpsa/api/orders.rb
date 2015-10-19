module Vpsa
  module Api
    class Orders < Client
      require_all 'vpsa/searcher/operational', 'order_searcher'
      require_all 'vpsa/entity/commercial', 'order', 'item'
      
      base_uri "#{Vpsa::API_ADDRESS}/pedidos"
      
      def list(searcher = nil)
        raise ArgumentError unless searcher.nil? || searcher.is_a?(Vpsa::Searcher::Operational::OrderSearcher)
        
        return parse_response(self.class.get("/", :body => build_body(searcher.as_parameter),  :headers => header)) if searcher
        return parse_response(self.class.get("/", :body => build_body,  :headers => header)) unless searcher
      end
      
      def find(id)
        return parse_response(self.class.get("/#{id}", :body => build_body,  :headers => header))
      end

      def save(order)
        raise ArgumentError unless order.nil? || order.is_a?(Vpsa::Entity::Commercial::Order)
        return parse_response(self.class.post("/", :body => build_body(order.as_parameter),  :headers => header))
      end

    end
  end
end