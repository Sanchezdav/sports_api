# frozen_string_literal: true

require 'test_helper'

class OddsBetResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'odds/bets',
      response: stub_response(fixture: 'football/odds_pre_match/odds_bets/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_bet.list(search: 'under')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::OddsBet, response.data.first
    assert_equal 7, response.total
  end

  def test_find
    stub = stub_request(
      'odds/bets',
      response: stub_response(fixture: 'football/odds_pre_match/odds_bets/find')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_bet.find(id: 5)

    assert_instance_of SportsApi::Football::OddsBet, response
    assert_equal 5, response.id
    assert_equal 'Goals Over/Under', response.name
  end
end
