# frozen_string_literal: true

require 'test_helper'

class FixturePlayerStatisticResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'fixtures/players', response: stub_response(fixture: 'football/fixtures/fixture_player_statistic/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture_player_statistic.list(fixture: '169080')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::FixturePlayerStatistic, response.data.first
    assert_equal 2, response.total
  end
end
