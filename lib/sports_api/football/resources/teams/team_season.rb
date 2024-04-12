# frozen_string_literal: true

module SportsApi
  module Football
    class TeamSeasonResource < Resource
      # Arguments:
      # team: [Integer](required) - The team ID.
      def list(team:)
        response = get_request('teams/seasons', params: { team: team.to_s })
        Collection.from_response(response, type: SportsApi::Football::TeamSeason)
      end
    end
  end
end
