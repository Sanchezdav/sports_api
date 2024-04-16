# frozen_string_literal: true

module SportsApi
  module Football
    class FixtureStatisticResource < Resource
      # Arguments:
      # fixture: [Integer](required) - The fixture ID.
      # team: [Integer](optional) - The team ID.
      # type: [String](optional) - The type of statistics ["Shots on Goal", "Corner Kicks", etc].
      def list(fixture:, **params)
        response = get_request('fixtures/statistics', params: { fixture:, **params })
        Collection.from_response(response, type: SportsApi::Football::FixtureStatistic)
      end
    end
  end
end
