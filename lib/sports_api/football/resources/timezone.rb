# frozen_string_literal: true

module SportsApi
  module Football
    class TimezoneResource < Resource
      def list
        response = get_request('timezone')
        Collection.from_response(response, type: SportsApi::Football::Timezone)
      end
    end
  end
end
