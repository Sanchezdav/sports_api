# frozen_string_literal: true

module SportsApi
  module Football
    class TrophyResource < Resource
      # Arguments:
      # player: [Integer](optional) - The player ID.
      # coach: [Integer](optional) - The coach ID.
      def list(**params)
        response = get_request('trophies', params:)
        Collection.from_response(response, type: SportsApi::Football::Trophy)
      end
    end
  end
end
