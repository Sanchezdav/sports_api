# frozen_string_literal: true

require 'test_helper'

class TeamSeasonResourceTest < Minitest::Test
  def test_list
    stub = stub_request('teams/seasons', response: stub_response(fixture: 'football/teams/team_season/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team_seasons.list(team: 33)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::TeamSeason, response.data.first
    assert_equal 1, response.total
  end
end
