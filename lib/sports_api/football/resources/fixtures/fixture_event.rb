# frozen_string_literal: true

module SportsApi
  module Football
    class FixtureEventResource < Resource
      # Arguments:
      # fixture: [Integer](required) - The fixture ID.
      # team: [Integer](optional) - The team ID.
      # player: [Integer](optional) - The player ID.
      # type: [String](optional) - The type of statistics ["Shots on Goal", "Corner Kicks", etc].
      def list(fixture:, **params)
        response = get_request('fixtures/events', params: { fixture:, **params })
        Collection.from_response(response, type: SportsApi::Football::FixtureEvent)
      end
    end
  end
end
