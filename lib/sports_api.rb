# frozen_string_literal: true

require_relative 'sports_api/version'

module SportsApi
  autoload :Football, 'sports_api/football'
  autoload :Error, 'sports_api/error'
end
