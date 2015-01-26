module Vpsa
  module Api
    class Provisions < Client
      base_uri "https://www.vpsa.com.br/apps/api/provisoes"

      def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header))
      end
    end
  end
end