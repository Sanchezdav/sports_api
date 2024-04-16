# frozen_string_literal: true

require 'test_helper'

class TeamResourceTest < Minitest::Test
  def test_list
    stub = stub_request('teams', response: stub_response(fixture: 'football/fixtures/fixture_head_to_head/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture_head_to_head.list(h2h: '33-34')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::FixtureHeadToHead, response.data.first
    assert_equal 1, response.total
  end
end
