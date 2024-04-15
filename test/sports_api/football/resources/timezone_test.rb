# frozen_string_literal: true

require 'test_helper'

class TimezoneResourceTest < Minitest::Test
  def test_list
    stub = stub_request('timezone', response: stub_response(fixture: 'football/timezones/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.timezone.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Timezone, response.data.first
    assert_equal 5, response.total
  end
end
