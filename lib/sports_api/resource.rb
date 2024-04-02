# frozen_string_literal: true

module SportsApi
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(path, params: {}, headers: {})
      client.connection.get(path, params, default_headers.merge(headers))
    end

    def default_headers
      { "x-apisports-key": client.api_key }
    end
  end
end
