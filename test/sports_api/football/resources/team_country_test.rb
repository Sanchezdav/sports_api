# frozen_string_literal: true

require 'test_helper'

class TeamCountryResourceTest < Minitest::Test
  def test_list
    stub = stub_request('teams/countries', response: stub_response(fixture: 'football/teams/team_country/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.team_countries.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::TeamCountry, response.data.first
    assert_equal 3, response.total
  end
end
