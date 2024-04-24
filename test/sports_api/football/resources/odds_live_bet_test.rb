# frozen_string_literal: true

require 'test_helper'

class OddsLiveBetResourceTest < Minitest::Test
  def test_list
    stub = stub_request('odds/live/bets', response: stub_response(fixture: 'football/odds_in_play/odds_live_bet/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_live_bet.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::OddsLiveBet, response.data.first
    assert_equal 137, response.total
  end
end
