# frozen_string_literal: true

require 'test_helper'

class TimezoneResourceTest < Minitest::Test
  def test_list
    stub = stub_request('timezone', response: stub_response(fixture: 'football/timezones/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    timezones = client.timezone.list

    assert_equal SportsApi::Collection, timezones.class
    assert_equal SportsApi::Football::Timezone, timezones.data.first.class
    assert_equal 1, timezones.total
  end
end
