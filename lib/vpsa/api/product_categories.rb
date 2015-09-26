module Vpsa
  module Api
    class ProductCategories < Client
      require_all 'vpsa/entity/operational', 'product_category'
      
      base_uri "#{Vpsa::API_ADDRESS}/categorias-produto"
      
      def list
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end
      
      
    end
  end
end