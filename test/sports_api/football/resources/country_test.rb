# frozen_string_literal: true

require 'test_helper'

class CountryResourceTest < Minitest::Test
  def test_list
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.countries.list

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Country, response.data.first
    assert_equal 3, response.total
  end

  def test_list_by_search
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/list_by_search'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    response = client.countries.list(search: 'Mex')

    assert_instance_of SportsApi::Collection, response
    assert_instance_of SportsApi::Football::Country, response.data.first
    assert_equal 'Mexico', response.data.first.name
  end

  def test_find_by_code
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/find_by_code'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    country = client.countries.find_by_code(code: 'MX')

    assert_instance_of SportsApi::Football::Country, country
    assert_equal 'Mexico', country.name
    assert_equal 'MX', country.code
  end

  def test_find_by_name
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/find_by_name'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    country = client.countries.find_by_name(name: 'Mexico')

    assert_instance_of SportsApi::Football::Country, country
    assert_equal 'Mexico', country.name
    assert_equal 'MX', country.code
  end
end
