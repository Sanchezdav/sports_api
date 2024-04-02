# frozen_string_literal: true

module SportsApi
  module Football
    autoload :Client, "sports_api/football/client"
    autoload :Collection, "sports_api/collection"
    autoload :Object, "sports_api/object"
    autoload :Resource, "sports_api/resource"

    autoload :League, "sports_api/football/objects/league"

    autoload :LeagueResource, "sports_api/football/resources/league"
  end
end
