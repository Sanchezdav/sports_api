# frozen_string_literal: true

module SportsApi
  module Football
    class FixtureLineupResource < Resource
      # Arguments:
      # fixture: [Integer](required) - The fixture ID.
      # team: [Integer](optional) - The team ID.
      # player: [Integer](optional) - The player ID.
      # type: [String](optional) - The type of statistics ["Shots on Goal", "Corner Kicks", etc].
      def list(fixture:, **params)
        response = get_request('fixtures/lineups', params: { fixture:, **params })
        Collection.from_response(response, type: SportsApi::Football::FixtureLineup)
      end
    end
  end
end
