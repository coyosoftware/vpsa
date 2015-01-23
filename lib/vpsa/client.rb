require "httparty"

module Vpsa
  class Client
    class NoAccessTokenError < StandardError
      def message
        "Please provide an access token"
      end  
    end
    
    extend Vpsa::ClassMethods
    include HTTParty
    
    default_options.update(verify: false)
    default_options.update(header: {"Content-Type" => "application/json", "Accept" => "application/json"})
    
    require_all 'vpsa/api', 'third_parties'
    
    attr_accessor :access_token
    
    def initialize(access_token)
      raise NoAccessTokenError if access_token.nil? || access_token.strip == ""
      @access_token = access_token
    end
    
    def third_parties
      Vpsa::Api::ThirdParties.new(@access_token)
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
  end
end