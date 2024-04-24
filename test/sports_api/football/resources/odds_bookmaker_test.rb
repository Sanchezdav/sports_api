# frozen_string_literal: true

require 'test_helper'

class OddsBookmakerResourceTest < Minitest::Test
  def test_list
    stub = stub_request(
      'odds/bookmakers',
      response: stub_response(fixture: 'football/odds_pre_match/odds_bookmakers/list')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_bookmaker.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::OddsBookmaker, response.data.first
    assert_equal 15, response.total
  end

  def test_find
    stub = stub_request(
      'odds/bookmakers',
      response: stub_response(fixture: 'football/odds_pre_match/odds_bookmakers/find')
    )
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_bookmaker.find(id: 8)

    assert_instance_of SportsApi::Football::OddsBookmaker, response
    assert_equal 8, response.id
    assert_equal 'Bet365', response.name
  end
end
