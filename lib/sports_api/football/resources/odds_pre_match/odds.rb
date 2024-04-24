# frozen_string_literal: true

module SportsApi
  module Football
    class OddsResource < Resource
      # Arguments:
      # fixture: [Integer](optional) - The fixture ID.
      # league: [Integer](optional) - The league ID.
      # bet: [Integer](optional) - The bet ID.
      # bookmaker: [Integer](optional) - The bookmaker ID.
      # season: [Integer](optional) - The season of the league (= YYYY).
      # date: [String](optional) - A valid date (= YYYY-MM-DD).
      # timezone: [String](optional) - A valid timezone from the endpoint Timezone.
      # page: [Integer](optional) - Use for the pagination (default 1).
      def list(**params)
        response = get_request('odds', params:)
        Collection.from_response(response, type: SportsApi::Football::Odds)
      end
    end
  end
end
