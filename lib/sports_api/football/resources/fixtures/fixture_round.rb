# frozen_string_literal: true

module SportsApi
  module Football
    class FixtureRoundResource < Resource
      # Arguments:
      # league: [Integer](required) - The league ID.
      # season: [Integer](required) - The season year of the league (= YYYY).
      # current: [Boolean](optional) - The current round ["true", "false"].
      def list(league:, season:, **params)
        response = get_request('fixtures/rounds', params: { league:, season:, **params })
        Collection.from_response(response, type: SportsApi::Football::FixtureRound)
      end
    end
  end
end
