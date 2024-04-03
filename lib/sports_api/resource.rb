# frozen_string_literal: true

module SportsApi
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(path, params: {}, headers: {})
      handle_response(client.connection.get(path, params, default_headers.merge(headers)))
    end

    private

    def default_headers
      { "x-apisports-key": client.api_key }
    end

    def handle_response(response)
      case response.status
      when 204
        raise Error, response.body.dig("errors", "bug")
      when 499, 500
        raise Error, response.body["message"]
      end

      response
    end
  end
end
