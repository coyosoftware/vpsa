module Vpsa
  module Api
    class UserData < Client
      base_uri "#{Vpsa::API_ADDRESS}/dados-login"

      def get
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end
    end
  end
end