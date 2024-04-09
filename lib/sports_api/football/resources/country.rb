# frozen_string_literal: true

module SportsApi
  module Football
    class CountryResource < Resource
      def list(**params)
        response = get_request('countries', params:)
        Collection.from_response(response, type: SportsApi::Football::Country)
      end

      def find_by_code(code:)
        response = get_request('countries', params: { code: code.to_s })
        SportsApi::Football::Country.new(response.body['response'][0])
      end

      def find_by_name(name:)
        response = get_request('countries', params: { name: name.to_s })
        SportsApi::Football::Country.new(response.body['response'][0])
      end
    end
  end
end
