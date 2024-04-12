# frozen_string_literal: true

require 'test_helper'

class FixtureRoundResourceTest < Minitest::Test
  def test_list
    stub = stub_request('fixtures/rounds', response: stub_response(fixture: 'football/fixtures/fixture_round/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture_round.list(league: 39, season: 2019)

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::FixtureRound, response.data.first.class
    assert_equal 38, response.total
  end
end
