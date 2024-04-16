# frozen_string_literal: true

module SportsApi
  module Football
    class FixtureHeadToHeadResource < Resource
      # Arguments:
      # h2h: [String](required) - The IDs of the teams.
      # date: [String](optional) - A valid date (= YYYY-MM-DD).
      # league: [Integer](optional) - The league ID.
      # season: [Integer](optional) - The season year of the league (= YYYY).
      # last: [Integer](optional) - For the X last fixtures.
      # next: [Integer](optional) - For the X next fixtures.
      # from: [String](optional) - A valid date (= YYYY-MM-DD).
      # to: [String](optional) - A valid date (= YYYY-MM-DD).
      # status: [String](optional) - One or more fixture status short ["NS", "NS-PST-FT"].
      # venue: [Integer](optional) - The venue ID of the fixture.
      # timezone: [String](optional) - A valid timezone from the endpoint Timezone.
      def list(h2h:, **params)
        response = get_request('fixtures/headtohead', params: { h2h:, **params })
        Collection.from_response(response, type: SportsApi::Football::FixtureHeadToHead)
      end
    end
  end
end
