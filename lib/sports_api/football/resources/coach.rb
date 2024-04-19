# frozen_string_literal: true

module SportsApi
  module Football
    class CoachResource < Resource
      # Arguments:
      # id: [Integer](optional) - The coach ID.
      # team: [Integer](optional) - The team ID.
      # search: [String](optional) - The name of the coach (>= XXX).
      def list(**params)
        response = get_request('coachs', params:)
        Collection.from_response(response, type: SportsApi::Football::Coach)
      end

      def find(id:)
        response = get_request('coachs', params: { id: id.to_s })
        SportsApi::Football::Coach.new(response.body['response'][0])
      end
    end
  end
end
