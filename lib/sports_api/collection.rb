# frozen_string_literal: true

module SportsApi
  class Collection
    attr_reader :data, :total, :current, :results

    # Example usage:
    # from_reponse(response, key: "response", type: League)
    # SportsApi::Collection.from_response(response, type: SportsApi::Football::League)
    def self.from_response(response, type:, key: 'response')
      body = response.body

      new(
        data: body[key].map { |attrs| type.new(attrs) },
        total: body.dig('paging', 'total'),
        current: body.dig('paging', 'current'),
        results: body['paging']
      )
    end

    def initialize(data:, total:, current:, results:)
      @data = data
      @total = total
      @current = current
      @results = results
    end
  end
end
