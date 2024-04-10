# frozen_string_literal: true

require 'test_helper'

class TeamCountryResourceTest < Minitest::Test
  def test_list
    stub = stub_request('teams/countries', response: stub_response(fixture: 'football/teams/team_country/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team_country.list

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::TeamCountry, response.data.first.class
    assert_equal 3, response.total
  end
end
