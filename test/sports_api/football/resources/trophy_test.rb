# frozen_string_literal: true

require 'test_helper'

class TrophyResourceTest < Minitest::Test
  def test_list
    stub = stub_request('trophies', response: stub_response(fixture: 'football/trophies/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.trophies.list(player: 276)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Trophy, response.data.first
    assert_equal 38, response.total
  end
end
