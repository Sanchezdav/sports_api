# frozen_string_literal: true

require 'test_helper'

class PlayerResourceTest < Minitest::Test
  def test_list
    stub = stub_request('players', response: stub_response(fixture: 'football/players/player/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.players.list(id: 276, season: 2019)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Player, response.data.first
    assert_equal 1, response.total
  end
end
