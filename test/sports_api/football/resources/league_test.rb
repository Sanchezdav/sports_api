# frozen_string_literal: true

require 'test_helper'

class LeagueResourceTest < Minitest::Test
  def test_list
    stub = stub_request('leagues', response: stub_response(fixture: 'football/leagues/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    leagues = client.league.list

    assert_equal SportsApi::Collection, leagues.class
    assert_equal SportsApi::Football::League, leagues.data.first.class
    assert_equal 1, leagues.total
  end

  def test_find
    stub = stub_request('leagues', response: stub_response(fixture: 'football/leagues/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    league = client.league.find(id: 262)

    assert_equal SportsApi::Football::League, league.class
    assert_equal 262, league.league.id
    assert_equal 'Liga MX', league.league.name
    assert_equal 'Mexico', league.country.name
  end
end
