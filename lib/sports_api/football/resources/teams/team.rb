# frozen_string_literal: true

module SportsApi
  module Football
    class TeamResource < Resource
      # Arguments:
      # id: [Integer](optional) - The team ID.
      # name: [String](optional) - The name of the team.
      # league: [Integer](optional) - The league ID.
      # season: [Integer](optional) - The season year (= YYYY).
      # country: [String] (optional) - The name of the country.
      # code: [String] (optional) - The country code (= XXX).
      # venue: [String] (optional) - The venue ID.
      # search: [String] (optional) - The team or country name, can be some letters (>= XXX).
      def list(**params)
        response = get_request('teams', params:)
        Collection.from_response(response, type: SportsApi::Football::Team)
      end

      def find(id:)
        response = get_request('teams', params: { id: id.to_s })
        SportsApi::Football::Team.new(response.body['response'][0])
      end
    end
  end
end
