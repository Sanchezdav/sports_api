# frozen_string_literal: true

require 'test_helper'

class VenueResourceTest < Minitest::Test
  def test_list
    stub = stub_request('venues', response: stub_response(fixture: 'football/venues/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.venue.list(search: 'Mex')

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::Venue, response.data.first.class
    assert_equal 2, response.total
  end

  def test_find
    stub = stub_request('venues', response: stub_response(fixture: 'football/venues/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.venue.find(id: 1069)

    assert_equal SportsApi::Football::Venue, response.class
    assert_equal 1069, response.id
    assert_equal 'Estadio Azteca', response.name
    assert_equal 'Mexico', response.country
  end
end
