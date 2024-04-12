# frozen_string_literal: true

module SportsApi
  module Football
    class FixtureResource < Resource
      # Arguments:
      # id: [Integer](optional) - The fixture ID.
      # ids: [String](optional) - One or more fixture IDs (id-id-id).
      # live: [String](optional) - All or several leagues ids ["all", "id-id"]
      # date: [String](optional) - The date of the fixture (= YYYY-MM-DD).
      # league: [Integer](optional) - The league ID.
      # season: [Integer](optional) - The season year (= YYYY).
      # last: [Integer](optional) - For the X last fixtures (<= 2 characters).
      # next: [Integer](optional) - For the X next fixtures (<= 2 characters).
      # from: [String](optional) - A valid date (= YYYY-MM-DD).
      # to: [String](optional) - A valid date (= YYYY-MM-DD).
      # round: [String](optional) - The round of the fixture.
      # status: [String](optional) - One or more fixture status short ["NS", "NS-PST-FT"].
      # venue: [Integer] (optional) - The venue ID.
      # timezone: [String](optional) - A valid timezone from the endpoint Timezone.
      def list(**params)
        response = get_request('fixtures', params:)
        Collection.from_response(response, type: SportsApi::Football::Fixture)
      end

      def find(id:)
        response = get_request('fixtures', params: { id: id.to_s })
        SportsApi::Football::Fixture.new(response.body['response'][0])
      end
    end
  end
end
