# frozen_string_literal: true

module SportsApi
  module Football
    class SidelinedResource < Resource
      # Arguments:
      # player: [Integer](optional) - The player ID.
      # coach: [Integer](optional) - The coach ID.
      def list(**params)
        response = get_request('sidelined', params:)
        Collection.from_response(response, type: SportsApi::Football::Sidelined)
      end
    end
  end
end
