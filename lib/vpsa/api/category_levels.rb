module Vpsa
  module Api
    class CategoryLevels < Client
      require_all 'vpsa/entity/operational', 'category_level'
      
      base_uri "#{Vpsa::API_ADDRESS}/niveis-categoria-produto"
      
      def list
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end
      
      
    end
  end
end