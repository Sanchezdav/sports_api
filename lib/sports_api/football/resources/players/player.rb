# frozen_string_literal: true

module SportsApi
  module Football
    class PlayerResource < Resource
      # Arguments:
      # id: [Integer](optional) - The player ID.
      # team: [Integer](optional) - The team ID.
      # league: [Integer](optional) - The league ID.
      # season: [Integer](optional) - The season of the league (= YYYY).
      #   Requires the fields Id, League or Team
      # search: [String](optional) - The name of the coach (>= XXXX).
      # page: [Integer](optional) - Use for the pagination (default: 1).
      def list(**params)
        response = get_request('players', params:)
        Collection.from_response(response, type: SportsApi::Football::Player)
      end
    end
  end
end
