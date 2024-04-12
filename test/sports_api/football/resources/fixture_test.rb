# frozen_string_literal: true

require 'test_helper'

class FixtureResourceTest < Minitest::Test
  def test_list
    stub = stub_request('fixtures', response: stub_response(fixture: 'football/fixtures/fixture/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture.list(live: 'all')

    assert_equal SportsApi::Collection, response.class
    assert_equal SportsApi::Football::Fixture, response.data.first.class
    assert_equal 1, response.total
  end

  def test_find
    stub = stub_request('fixtures', response: stub_response(fixture: 'football/fixtures/fixture/find'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.fixture.find(id: '239625')

    assert_equal SportsApi::Football::Fixture, response.class
    assert_equal 239_625, response.fixture.id
    assert_equal 'Botola Pro', response.league.name
    assert_equal 0, response.goals.home
  end
end
