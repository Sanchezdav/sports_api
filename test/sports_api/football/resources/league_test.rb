# frozen_string_literal: true

require 'test_helper'

class LeagueResourceTest < Minitest::Test
  def test_list
    stub = stub_request('leagues', response: stub_response(fixture: 'football/leagues/league/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.leagues.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::League, response.data.first
    assert_equal 1, response.total
  end

  def test_find
    stub = stub_request('leagues', response: stub_response(fixture: 'football/leagues/league/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.leagues.find(id: 262)

    assert_instance_of SportsApi::Football::League, response
    assert_equal 262, response.league.id
    assert_equal 'Liga MX', response.league.name
    assert_equal 'Mexico', response.country.name
  end
end
