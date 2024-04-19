# frozen_string_literal: true

require 'test_helper'

class PredictionResourceTest < Minitest::Test
  def test_list
    stub = stub_request('predictions', response: stub_response(fixture: 'football/predictions/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.prediction.list(fixture: '198772')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Prediction, response.data.first
    assert_equal 1, response.total
  end
end
