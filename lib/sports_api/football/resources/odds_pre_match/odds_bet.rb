# frozen_string_literal: true

module SportsApi
  module Football
    class OddsBetResource < Resource
      # Arguments:
      # id: [Integer](optional) - The bet ID.
      # search: [String](optional) - The name of the bet (>= XXX).
      def list(**params)
        response = get_request('odds/bets', params:)
        Collection.from_response(response, type: SportsApi::Football::OddsBet)
      end

      def find(id:)
        response = get_request('odds/bets', params: { id: id.to_s })
        SportsApi::Football::OddsBet.new(response.body['response'][0])
      end
    end
  end
end
