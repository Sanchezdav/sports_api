# frozen_string_literal: true

module SportsApi
  module Football
    class VenueResource < Resource
      # Arguments:
      # id: [String](optional) - The venue ID.
      # name: [String](optional) - The name of the venue.
      # city: [String](optional) - The city of the venue.
      # country: [String] (optional) - The country name of the venue.
      # search: [String] (optional) - The name, city or the country of the venue (>= XXX).
      def list(**params)
        response = get_request('venues', params:)
        Collection.from_response(response, type: SportsApi::Football::Venue)
      end

      def find(id:)
        response = get_request('venues', params: { id: id.to_s })
        SportsApi::Football::Venue.new(response.body['response'][0])
      end
    end
  end
end
