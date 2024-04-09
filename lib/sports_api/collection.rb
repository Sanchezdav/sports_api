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
        total: body['results'],
        paging: body['paging'],
        paging_total: body.dig('paging', 'total'),
        paging_current: body.dig('paging', 'current')
      )
    end

    def initialize(data:, total:, paging:, paging_total:, paging_current:)
      @data = data
      @total = total
      @paging = paging
      @paging_total = paging_total
      @paging_current = paging_current
    end
  end
end
