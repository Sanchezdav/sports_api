# frozen_string_literal: true

module SportsApi
  module Football
    class LeagueSeasonResource < Resource
      def list
        response = get_request('leagues/seasons')
        Collection.from_response(response, type: SportsApi::Football::LeagueSeason)
      end
    end
  end
end
