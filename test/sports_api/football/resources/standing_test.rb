# frozen_string_literal: true

require 'test_helper'

class StandingResourceTest < Minitest::Test
  def test_list
    stub = stub_request('standings', response: stub_response(fixture: 'football/standings/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.standings.list(season: 2019, league: 39)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Standing, response.data.first
    assert_equal 1, response.total
  end
end
