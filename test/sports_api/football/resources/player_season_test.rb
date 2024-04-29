# frozen_string_literal: true

require 'test_helper'

class PlayerSeasonResourceTest < Minitest::Test
  def test_list
    stub = stub_request('players/seasons', response: stub_response(fixture: 'football/players/player_season/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.player_seasons.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::PlayerSeason, response.data.first
    assert_equal 35, response.total
  end
end
