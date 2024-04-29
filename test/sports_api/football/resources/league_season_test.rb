# frozen_string_literal: true

require 'test_helper'

class LeagueSeasonResourceTest < Minitest::Test
  def test_list
    stub = stub_request('leagues/seasons', response: stub_response(fixture: 'football/leagues/season/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.league_seasons.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::LeagueSeason, response.data.first
    assert_equal 12, response.total
  end
end
