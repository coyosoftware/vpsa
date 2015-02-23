require "httparty"

module Vpsa
  class Client
    extend Vpsa::ClassMethods
    include HTTParty
    
    default_options.update(verify: false)
    parser Proc.new {|b| JSON.parse(b) rescue b}
    
    require_all 'vpsa/api', 'third_parties', 'entities', 'default_entries', 'provisions', 'user_data', 'installments', 'credit_limits', 'client_classes'
    
    attr_accessor :access_token
    
    def initialize(access_token)
      raise NoAccessTokenError if access_token.nil? || access_token.strip == ""
      @access_token = access_token
    end
    
    def third_parties
      Vpsa::Api::ThirdParties.new(@access_token)
    end
    
    def entities
      Vpsa::Api::Entities.new(@access_token)
    end
    
    def default_entries
      Vpsa::Api::DefaultEntries.new(@access_token)
    end
    
    def provisions
      Vpsa::Api::Provisions.new(@access_token)
    end
    
    def user_data
      Vpsa::Api::UserData.new(@access_token)
    end
    
    def installments
      Vpsa::Api::Installments.new(@access_token)
    end

    def credit_limits
      Vpsa::Api::CreditLimits.new(@access_token)
    end

    def client_classes
      Vpsa::Api::ClientClasses.new(@access_token)
    end
    
    protected
      def header
        {"Content-Type" => "application/json", "Accept" => "application/json"}
      end
      
      def build_body(parameters = {})
        parameters.merge(:token => @access_token).to_json
      end
      
      def parse_response(response)
        return Vpsa::Client::Response.new(response)
      end
    
    class Response
      attr_accessor :status, :payload, :raw_response
      
      def initialize(response)
        @status = response.code
        @payload = response.parsed_response
        @raw_response = response
      end
    end
    
    class NoAccessTokenError < StandardError
      def message
        "Please provide an access token"
      end  
    end
  end
end