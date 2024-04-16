# frozen_string_literal: true

require 'test_helper'

class FixtureLineupResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'fixtures/lineups', response: stub_response(fixture: 'football/fixtures/fixture_lineup/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture_lineup.list(fixture: '592872')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::FixtureLineup, response.data.first
    assert_equal 2, response.total
  end
end
