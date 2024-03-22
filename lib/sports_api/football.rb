# frozen_string_literal: true

module SportsApi
  module Football
    autoload :Client, "sports_api/football/client"
    autoload :Collection, "sports_api/collection"
    autoload :Object, "sports_api/object"

    autoload :League, "sports_api/football/objects/league"
  end
end
