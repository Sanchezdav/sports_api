# frozen_string_literal: true

module SportsApi
  module Football
    class OddsLiveBetResource < Resource
      # Arguments:
      # id: [Integer](optional) - The bet ID.
      # search: [String](optional) - The name of the bet (>= XXX).
      def list(**params)
        response = get_request('odds/live/bets', params:)
        Collection.from_response(response, type: SportsApi::Football::OddsLiveBet)
      end

      def find(id:)
        response = get_request('odds/live/bets', params: { id: id.to_s })
        SportsApi::Football::OddsLiveBet.new(response.body['response'][0])
      end
    end
  end
end
