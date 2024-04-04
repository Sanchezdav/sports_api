# frozen_string_literal: true

module SportsApi
  module Football
    class LeagueResource < Resource
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
