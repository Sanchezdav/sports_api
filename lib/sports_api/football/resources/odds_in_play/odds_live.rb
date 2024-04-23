# frozen_string_literal: true

module SportsApi
  module Football
    class OddsLiveResource < Resource
      # Arguments:
      # fixture: [Integer](optional) - The fixture ID.
      # league: [Integer](optional) - The league ID.
      # bet: [Integer](optional) - The bet ID.
      def list(**params)
        response = get_request('odds/live', params:)
        Collection.from_response(response, type: SportsApi::Football::OddsLive)
      end
    end
  end
end
