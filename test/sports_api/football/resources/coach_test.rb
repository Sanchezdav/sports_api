# frozen_string_literal: true

require 'test_helper'

class CoachResourceTest < Minitest::Test
  def test_list
    stub = stub_request('coachs', response: stub_response(fixture: 'football/coachs/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.coach.list(search: 'Tuchel')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Coach, response.data.first
    assert_equal 'T. Tuchel', response.data.first.name
  end

  def test_find
    stub = stub_request('coachs', response: stub_response(fixture: 'football/coachs/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.coach.find(id: 40)

    assert_instance_of SportsApi::Football::Coach, response
    assert_equal 40, response.id
    assert_equal 'T. Tuchel', response.name
  end
end
