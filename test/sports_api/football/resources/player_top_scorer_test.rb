# frozen_string_literal: true

require 'test_helper'

class PlayerTopScorerResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'players/topscorers',
      response: stub_response(fixture: 'football/players/player_top_scorer/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.player_top_scorers.list(league: 61, season: 2018)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::PlayerTopScorer, response.data.first
    assert_equal 20, response.total
  end
end
