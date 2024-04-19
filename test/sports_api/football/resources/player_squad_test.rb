# frozen_string_literal: true

require 'test_helper'

class PlayerSquadResourceTest < Minitest::Test
  def test_list
    stub = stub_request('players/squads', response: stub_response(fixture: 'football/players/player_squad/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.player_squad.list(team: 33)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::PlayerSquad, response.data.first
    assert_equal 1, response.total
  end
end
