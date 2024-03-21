# frozen_string_literal: true

require "faraday"

module SportsApi
  module Football
    class Client
      BASE_URL = "https://v3.football.api-sports.io/"

      attr_reader :api_key, :adapter

      def initialize(api_key:, adapter: Faraday.default_adapter)
        @api_key = api_key
        @adapter = adapter
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = BASE_URL
          conn.request :json
          conn.response :json, content_type: "application/json"
          conn.adapter adapter
          conn.headers["x-apisports-key"] = api_key
        end
      end

      def inspect
        "#<SportsApi::Football::Client>"
      end
    end
  end
end
