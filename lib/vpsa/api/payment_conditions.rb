module Vpsa
  module Api
    class PaymentConditions < Client

      base_uri "#{Vpsa::API_ADDRESS}/planos-pagamento-compras"

      def list
        return parse_response(self.class.get("/", :body => build_body,  :headers => header))
      end


    end
  end
end
