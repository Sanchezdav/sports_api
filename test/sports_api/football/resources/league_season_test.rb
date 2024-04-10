# frozen_string_literal: true

require 'test_helper'

class LeagueSeasonResourceTest < Minitest::Test
  def test_list
    stub = stub_request('leagues/seasons', response: stub_response(fixture: 'football/leagues/season/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.league_season.list

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::LeagueSeason, response.data.first.class
    assert_equal 12, response.total
  end
end
