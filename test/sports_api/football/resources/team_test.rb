# frozen_string_literal: true

require 'test_helper'

class TeamResourceTest < Minitest::Test
  def test_list
    stub = stub_request('teams', response: stub_response(fixture: 'football/teams/team/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team.list

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::Team, response.data.first.class
    assert_equal 2, response.total
  end

  def test_find
    stub = stub_request('teams', response: stub_response(fixture: 'football/teams/team/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team.find(id: 2287)

    assert_equal SportsApi::Football::Team, response.class
    assert_equal 2287, response.team.id
    assert_equal 'Club America', response.team.name
    assert_equal 'Mexico', response.team.country
  end
end
