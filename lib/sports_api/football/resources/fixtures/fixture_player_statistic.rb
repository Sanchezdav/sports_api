# frozen_string_literal: true

module SportsApi
  module Football
    class FixturePlayerStatisticResource < Resource
      # Arguments:
      # fixture: [Integer](required) - The fixture ID.
      # team: [Integer](optional) - The team ID.
      def list(fixture:, **params)
        response = get_request('fixtures/players', params: { fixture:, **params })
        Collection.from_response(response, type: SportsApi::Football::FixturePlayerStatistic)
      end
    end
  end
end
