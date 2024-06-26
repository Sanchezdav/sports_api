# frozen_string_literal: true

require 'test_helper'

class TeamStatisticResourceTest < Minitest::Test
  def test_find
    stub = stub_request('teams/statistics', response: stub_response(fixture: 'football/teams/team_statistic/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team_statistics.find(league: 39, team: 33, season: 2019)

    assert_instance_of SportsApi::Football::TeamStatistic, response
    assert_equal 39, response.league.id
    assert_equal 33, response.team.id
  end
end
