# frozen_string_literal: true

module SportsApi
  module Football
    class PredictionResource < Resource
      # Arguments:
      # fixture: [Integer](required) - The fixture ID.
      def list(fixture:)
        response = get_request('predictions', params: { fixture: fixture.to_s })
        Collection.from_response(response, type: SportsApi::Football::Prediction)
      end
    end
  end
end
