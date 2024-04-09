# frozen_string_literal: true

require 'test_helper'

class CountryResourceTest < Minitest::Test
  def test_list
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/list'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    countries = client.country.list

    assert_equal SportsApi::Collection, countries.class
    assert_equal SportsApi::Football::Country, countries.data.first.class
    assert_equal 1, countries.total
  end

  def test_list_by_search
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/list_by_search'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    countries = client.country.list(search: 'Mex')

    assert_equal SportsApi::Collection, countries.class
    assert_equal SportsApi::Football::Country, countries.data.first.class
    assert_equal 'Mexico', countries.data.first.name
  end

  def test_find_by_code
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/find_by_code'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    country = client.country.find_by_code(code: 'MX')

    assert_equal SportsApi::Football::Country, country.class
    assert_equal 'Mexico', country.name
    assert_equal 'MX', country.code
  end

  def test_find_by_name
    stub = stub_request('countries', response: stub_response(fixture: 'football/countries/find_by_name'))
    client = SportsApi::Football::Client.new(api_key: 'fake', adapter: :test, stubs: stub)
    country = client.country.find_by_name(name: 'Mexico')

    assert_equal SportsApi::Football::Country, country.class
    assert_equal 'Mexico', country.name
    assert_equal 'MX', country.code
  end
end
