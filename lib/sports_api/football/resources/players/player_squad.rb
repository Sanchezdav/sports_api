# frozen_string_literal: true

module SportsApi
  module Football
    class PlayerSquadResource < Resource
      # Arguments:
      # team: [Integer](optional) - The team ID.
      # player: [Integer](optional) - The player ID.
      def list(**params)
        response = get_request('players/squads', params:)
        Collection.from_response(response, type: SportsApi::Football::PlayerSquad)
      end
    end
  end
end
