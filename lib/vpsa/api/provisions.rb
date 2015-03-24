module Vpsa
  module Api
    class Provisions < Client
      base_uri "#{Vpsa::API_ADDRESS}/provisoes-contas"

      def create(data)
        return parse_response(self.class.post("/", :body => build_body(data), :headers => header))
      end
      alias :new :create
    end
  end
end