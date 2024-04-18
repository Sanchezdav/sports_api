# frozen_string_literal: true

module SportsApi
  module Football
    autoload :Client, 'sports_api/football/client'
    autoload :Collection, 'sports_api/collection'
    autoload :Object, 'sports_api/object'
    autoload :Resource, 'sports_api/resource'

    autoload :Country, 'sports_api/football/objects/country'
    autoload :Fixture, 'sports_api/football/objects/fixtures/fixture'
    autoload :FixtureEvent, 'sports_api/football/objects/fixtures/fixture_event'
    autoload :FixtureHeadToHead, 'sports_api/football/objects/fixtures/fixture_head_to_head'
    autoload :FixtureLineup, 'sports_api/football/objects/fixtures/fixture_lineup'
    autoload :FixturePlayerStatistic, 'sports_api/football/objects/fixtures/fixture_player_statistic'
    autoload :FixtureRound, 'sports_api/football/objects/fixtures/fixture_round'
    autoload :FixtureStatistic, 'sports_api/football/objects/fixtures/fixture_statistic'
    autoload :League, 'sports_api/football/objects/leagues/league'
    autoload :LeagueSeason, 'sports_api/football/objects/leagues/league_season'
    autoload :Standing, 'sports_api/football/objects/standing'
    autoload :Team, 'sports_api/football/objects/teams/team'
    autoload :TeamCountry, 'sports_api/football/objects/teams/team_country'
    autoload :TeamSeason, 'sports_api/football/objects/teams/team_season'
    autoload :TeamStatistic, 'sports_api/football/objects/teams/team_statistic'
    autoload :Timezone, 'sports_api/football/objects/timezone'
    autoload :Venue, 'sports_api/football/objects/venue'

    autoload :CountryResource, 'sports_api/football/resources/country'
    autoload :FixtureResource, 'sports_api/football/resources/fixtures/fixture'
    autoload :FixtureEventResource, 'sports_api/football/resources/fixtures/fixture_event'
    autoload :FixtureHeadToHeadResource, 'sports_api/football/resources/fixtures/fixture_head_to_head'
    autoload :FixtureLineupResource, 'sports_api/football/resources/fixtures/fixture_lineup'
    autoload :FixturePlayerStatisticResource, 'sports_api/football/resources/fixtures/fixture_player_statistic'
    autoload :FixtureRoundResource, 'sports_api/football/resources/fixtures/fixture_round'
    autoload :FixtureStatisticResource, 'sports_api/football/resources/fixtures/fixture_statistic'
    autoload :LeagueResource, 'sports_api/football/resources/leagues/league'
    autoload :LeagueSeasonResource, 'sports_api/football/resources/leagues/league_season'
    autoload :StandingResource, 'sports_api/football/resources/standing'
    autoload :TeamCountryResource, 'sports_api/football/resources/teams/team_country'
    autoload :TeamResource, 'sports_api/football/resources/teams/team'
    autoload :TeamSeasonResource, 'sports_api/football/resources/teams/team_season'
    autoload :TeamStatisticResource, 'sports_api/football/resources/teams/team_statistic'
    autoload :TimezoneResource, 'sports_api/football/resources/timezone'
    autoload :VenueResource, 'sports_api/football/resources/venue'
  end
end
