module Vpsa
  module Api
    class Products < Client
      require_all 'vpsa/entity/commercial', 'product'
      
      base_uri "#{Vpsa::API_ADDRESS}/produtos"
          
      def save(data)
        return parse_response(self.class.post("/", :body => build_body(data),  :headers => header))
      end
      
      def update(id, data)
        return parse_response(self.class.put("/#{id}", :body => build_body(data), :headers => header))
      end
    end
  end
end