# frozen_string_literal: true

module SportsApi
  module Football
    class OddsBookmakerResource < Resource
      # Arguments:
      # id: [Integer](optional) - The bookmaker ID.
      # search: [String](optional) - The name of the bookmaker (>= XXX).
      def list(**params)
        response = get_request('odds/bookmakers', params:)
        Collection.from_response(response, type: SportsApi::Football::OddsBookmaker)
      end

      def find(id:)
        response = get_request('odds/bookmakers', params: { id: id.to_s })
        SportsApi::Football::OddsBookmaker.new(response.body['response'][0])
      end
    end
  end
end
