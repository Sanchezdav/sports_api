# frozen_string_literal: true

module SportsApi
  module Football
    class TransferResource < Resource
      # Arguments:
      # player: [Integer](optional) - The player ID.
      # team: [Integer](optional) - The team ID.
      def list(**params)
        response = get_request('transfers', params:)
        Collection.from_response(response, type: SportsApi::Football::Transfer)
      end
    end
  end
end
