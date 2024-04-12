# frozen_string_literal: true

require 'test_helper'

class StandingResourceTest < Minitest::Test
  def test_list
    stub = stub_request('standings', response: stub_response(fixture: 'football/standings/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.standing.list(season: 2019, league: 39)

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::Standing, response.data.first.class
    assert_equal 1, response.total
  end
end
