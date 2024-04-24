# frozen_string_literal: true

require 'test_helper'

class OddsLiveBetResourceTest < Minitest::Test
  def test_list
    stub = stub_request('odds', response: stub_response(fixture: 'football/odds_pre_match/odds/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds.list(fixture: '326090', bookmaker: 6)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Odds, response.data.first
    assert_equal 1, response.total
  end
end
