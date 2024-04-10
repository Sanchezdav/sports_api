# frozen_string_literal: true

module SportsApi
  module Football
    autoload :Client, 'sports_api/football/client'
    autoload :Collection, 'sports_api/collection'
    autoload :Object, 'sports_api/object'
    autoload :Resource, 'sports_api/resource'

    autoload :League, 'sports_api/football/objects/leagues/league'
    autoload :LeagueSeason, 'sports_api/football/objects/leagues/league_season'
    autoload :Timezone, 'sports_api/football/objects/timezone'
    autoload :Country, 'sports_api/football/objects/country'
    autoload :Team, 'sports_api/football/objects/teams/team'
    autoload :TeamStatistic, 'sports_api/football/objects/teams/team_statistic'
    autoload :TeamSeason, 'sports_api/football/objects/teams/team_season'
    autoload :TeamCountry, 'sports_api/football/objects/teams/team_country'

    autoload :LeagueResource, 'sports_api/football/resources/leagues/league'
    autoload :LeagueSeasonResource, 'sports_api/football/resources/leagues/league_season'
    autoload :TimezoneResource, 'sports_api/football/resources/timezone'
    autoload :CountryResource, 'sports_api/football/resources/country'
    autoload :TeamResource, 'sports_api/football/resources/teams/team'
    autoload :TeamStatisticResource, 'sports_api/football/resources/teams/team_statistic'
    autoload :TeamSeasonResource, 'sports_api/football/resources/teams/team_season'
    autoload :TeamCountryResource, 'sports_api/football/resources/teams/team_country'
  end
end
