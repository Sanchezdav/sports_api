# frozen_string_literal: true

require 'test_helper'

class TransferResourceTest < Minitest::Test
  def test_list
    stub = stub_request('transfers', response: stub_response(fixture: 'football/transfers/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.transfer.list(player: '35845')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Transfer, response.data.first
    assert_equal 1, response.total
  end
end
