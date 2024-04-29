# frozen_string_literal: true

require 'test_helper'

class OddsLiveBetResourceTest < Minitest::Test
  def test_list
    stub = stub_request('odds/live/bets', response: stub_response(fixture: 'football/odds_in_play/odds_live_bet/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_live_bets.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::OddsLiveBet, response.data.first
    assert_equal 137, response.total
  end

  def test_find
    stub = stub_request('odds/live/bets', response: stub_response(fixture: 'football/odds_in_play/odds_live_bet/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_live_bets.find(id: 1)

    assert_instance_of SportsApi::Football::OddsLiveBet, response
    assert_equal 1, response.id
    assert_equal 'Over/Under Extra Time', response.name
  end
end
