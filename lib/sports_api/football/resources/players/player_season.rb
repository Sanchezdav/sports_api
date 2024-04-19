# frozen_string_literal: true

module SportsApi
  module Football
    class PlayerSeasonResource < Resource
      # Arguments:
      # player: [Integer](optional) - The player ID.
      def list(**params)
        response = get_request('players/seasons', params:)
        Collection.from_response(response, type: SportsApi::Football::PlayerSeason)
      end
    end
  end
end
