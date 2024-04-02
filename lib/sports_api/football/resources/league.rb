# frozen_string_literal: true

module SportsApi
  module Football
    class LeagueResource < Resource
      def list(**params)
        response = get_request("leagues", params:)
        Collection.from_response(response, type: SportsApi::Football::League)
      end
    end
  end
end
