# frozen_string_literal: true

require 'test_helper'

class TeamSeasonResourceTest < Minitest::Test
  def test_list
    stub = stub_request('teams/seasons', response: stub_response(fixture: 'football/teams/team_season/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team_season.list(team: 33)

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::TeamSeason, response.data.first.class
    assert_equal 1, response.total
  end
end
