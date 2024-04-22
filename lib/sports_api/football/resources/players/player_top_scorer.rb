# frozen_string_literal: true

module SportsApi
  module Football
    class PlayerTopScorerResource < Resource
      # Arguments:
      # league: [Integer](required) - The league ID.
      # season: [Integer](required) - The season of the league (= YYYY).
      def list(league:, season:)
        response = get_request(
          'players/topscorers',
          params: {
            league: league.to_s,
            season: season.to_s
          }
        )
        Collection.from_response(response, type: SportsApi::Football::PlayerTopScorer)
      end
    end
  end
end
