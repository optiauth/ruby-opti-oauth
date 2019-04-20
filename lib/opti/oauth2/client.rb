# frozen_string_literal: true

require 'uri'
require 'opti/oauth2/http'

module Opti
  module OAuth2
    class Client
      attr_reader :authorization_endpoint, :client_id

      def initialize authorization_endpoint:, client_id:, http_client: nil
        @authorization_endpoint = authorization_endpoint.strip.chomp('/')
        @client_id = client_id.strip
        @http = http_client || Http.new 
      end

      def authorization_url redirect_uri: nil
        params = {
          response_type: :code,
          client_id:     client_id,
          redirect_uri:  redirect_uri
        }.delete_if { |_k, v| v.nil? }

        query = URI.encode_www_form params
        "#{authorization_endpoint}?#{query}"
      end
    end
  end
end
