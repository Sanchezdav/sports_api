# frozen_string_literal: true

require 'test_helper'

class SidelinedResourceTest < Minitest::Test
  def test_list
    stub = stub_request('sidelined', response: stub_response(fixture: 'football/sidelined/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.sidelined.list(player: 276)

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Sidelined, response.data.first
    assert_equal 27, response.total
  end
end
