# frozen_string_literal: true

module SportsApi
  module Football
    class LeagueResource < Resource
      # Arguments:
      # name: [String](optional) - The name of the league.
      # country: [String] (optional) - The country name of the league.
      # code: [String] (optional) - The country code of the league.
      # season: [String] (optional) - The season of the league.
      # type: [String] (optional) - The type of the league ["league", "cup"].
      # current: [String] (optional) - The current status of the league ["true", "false"].
      # team: [String] (optional) - The team ID that has played at least one match.
      # search: [String] (optional) - The league or country name, can be some letters.
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
