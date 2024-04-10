# frozen_string_literal: true

module SportsApi
  module Football
    class TeamCountryResource < Resource
      def list
        response = get_request('teams/countries')
        Collection.from_response(response, type: SportsApi::Football::TeamCountry)
      end
    end
  end
end
