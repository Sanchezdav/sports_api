# frozen_string_literal: true

module SportsApi
  module Football
    class LeagueResource < Resource
      # Arguments:
      # name: [String](optional) - The name of the league.
      # country: [String] (optional) - The country name of the league.
      # code: [String] (optional) - The country code of the league (= XXX).
      # season: [Integer] (optional) - The season of the league (= YYYY).
      # type: [String] (optional) - The type of the league ["league", "cup"].
      # current: [Boolean] (optional) - The current status of the league ["true", "false"].
      # team: [Integer] (optional) - The team ID that has played at least one match.
      # search: [String] (optional) - The league or country name, can be some letters (>= XXX).
      def list(**params)
        response = get_request('leagues', params:)
        Collection.from_response(response, type: SportsApi::Football::League)
      end

      def find(id:)
        response = get_request('leagues', params: { id: id.to_s })
        SportsApi::Football::League.new(response.body['response'][0])
      end
    end
  end
end
