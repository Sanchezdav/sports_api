# frozen_string_literal: true

require 'test_helper'

class FixtureEventResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'fixtures/events', response: stub_response(fixture: 'football/fixtures/fixture_event/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture_events.list(fixture: '215662')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::FixtureEvent, response.data.first
    assert_equal 18, response.total
  end
end
