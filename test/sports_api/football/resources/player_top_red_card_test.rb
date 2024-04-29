# frozen_string_literal: true

require 'test_helper'

class PlayerTopRedCardResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'players/topredcards',
      response: stub_response(fixture: 'football/players/player_top_red_card/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.player_top_red_cards.list(league: 61, season: 2020)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::PlayerTopRedCard, response.data.first
    assert_equal 20, response.total
  end
end
