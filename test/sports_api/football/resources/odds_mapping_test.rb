# frozen_string_literal: true

require 'test_helper'

class OddsMappingResourceTest < Minitest::Test
  def test_list
    stub = stub_request('odds/mapping', response: stub_response(fixture: 'football/odds_pre_match/odds_mapping/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.odds_mapping.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::OddsMapping, response.data.first
    assert_equal 129, response.total
  end
end
