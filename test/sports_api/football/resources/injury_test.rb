# frozen_string_literal: true

require 'test_helper'

class InjuryResourceTest < Minitest::Test
  def test_list
    stub = stub_request('injuries', response: stub_response(fixture: 'football/injuries/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.injury.list(fixture: '686314')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Injury, response.data.first
    assert_equal 13, response.total
  end
end
