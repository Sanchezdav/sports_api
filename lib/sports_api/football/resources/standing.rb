# frozen_string_literal: true

module SportsApi
  module Football
    class StandingResource < Resource
      # Arguments:
      # league: [Integer](optional) - The league ID.
      # season: [Integer] (required) - The season of the league (= YYYY).
      # team: [Integer] (optional) - The team ID.
      def list(season:, **params)
        response = get_request('standings', params: { season: season.to_s, **params })
        Collection.from_response(response, type: SportsApi::Football::Standing)
      end
    end
  end
end
