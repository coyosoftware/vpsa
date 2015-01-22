module Vpsa
  module Api
    class ThirdParties < Client
      require_all 'vpsa/entity/administrative', 'third_party'
      
      base_uri "https://www.vpsa.com.br/apps/api/terceiros"

      def list
        self.class.get("/", :body => build_body({}),  :headers => header)
      end
    end
  end
end