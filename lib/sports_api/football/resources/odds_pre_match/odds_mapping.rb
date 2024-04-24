# frozen_string_literal: true

module SportsApi
  module Football
    class OddsMappingResource < Resource
      # Arguments:
      # page: [Integer](optional) - Use for the pagination (default 1).
      def list(**params)
        response = get_request('odds/mapping', params:)
        Collection.from_response(response, type: SportsApi::Football::OddsMapping)
      end
    end
  end
end
