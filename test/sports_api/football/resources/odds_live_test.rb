# frozen_string_literal: true

require 'test_helper'

class OddsLiveResourceTest < Minitest::Test
  def test_list
    stub = stub_request('odds/live', response: stub_response(fixture: 'football/odds_in_play/odds_live/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_lives.list(fixture: '721238')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::OddsLive, response.data.first
    assert_equal 1, response.total
  end
end
