# frozen_string_literal: true

module SportsApi
  module Football
    class InjuryResource < Resource
      # Arguments:
      # fixture: [Integer](optional) - The fixture ID.
      # league: [Integer](optional) - The league ID.
      # team: [Integer](optional) - The team ID.
      # player: [Integer](optional) - The player ID.
      # season: [Integer](optional) - The season of the league, required with league,
      #   team and player parameters (= YYYY).
      # date: [String](optional) - A valid date (= YYYY-MM-DD).
      # timezone: [String](optional) - A valid timezone from the endpoint Timezone.
      def list(**params)
        response = get_request('injuries', params:)
        Collection.from_response(response, type: SportsApi::Football::Injury)
      end
    end
  end
end
