# frozen_string_literal: true

require 'test_helper'

class FixtureStatisticResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'fixtures/statistics', response: stub_response(fixture: 'football/fixtures/fixture_statistic/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture_statistics.list(fixture: '463')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::FixtureStatistic, response.data.first
    assert_equal 1, response.total
  end
end
