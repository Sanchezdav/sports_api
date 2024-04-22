# frozen_string_literal: true

module SportsApi
  module Football
    autoload :Client, 'sports_api/football/client'
    autoload :Collection, 'sports_api/collection'
    autoload :Object, 'sports_api/object'
    autoload :Resource, 'sports_api/resource'

    autoload :Coach, 'sports_api/football/objects/coach'
    autoload :Country, 'sports_api/football/objects/country'
    autoload :Fixture, 'sports_api/football/objects/fixtures/fixture'
    autoload :FixtureEvent, 'sports_api/football/objects/fixtures/fixture_event'
    autoload :FixtureHeadToHead, 'sports_api/football/objects/fixtures/fixture_head_to_head'
    autoload :FixtureLineup, 'sports_api/football/objects/fixtures/fixture_lineup'
    autoload :FixturePlayerStatistic, 'sports_api/football/objects/fixtures/fixture_player_statistic'
    autoload :FixtureRound, 'sports_api/football/objects/fixtures/fixture_round'
    autoload :FixtureStatistic, 'sports_api/football/objects/fixtures/fixture_statistic'
    autoload :Injury, 'sports_api/football/objects/injury'
    autoload :League, 'sports_api/football/objects/leagues/league'
    autoload :LeagueSeason, 'sports_api/football/objects/leagues/league_season'
    autoload :Player, 'sports_api/football/objects/players/player'
    autoload :PlayerTopAssist, 'sports_api/football/objects/players/player_top_assist'
    autoload :PlayerTopScorer, 'sports_api/football/objects/players/player_top_scorer'
    autoload :PlayerTopYellowCard, 'sports_api/football/objects/players/player_top_yellow_card'
    autoload :PlayerSeason, 'sports_api/football/objects/players/player_season'
    autoload :PlayerSquad, 'sports_api/football/objects/players/player_squad'
    autoload :Prediction, 'sports_api/football/objects/prediction'
    autoload :Standing, 'sports_api/football/objects/standing'
    autoload :Team, 'sports_api/football/objects/teams/team'
    autoload :TeamCountry, 'sports_api/football/objects/teams/team_country'
    autoload :TeamSeason, 'sports_api/football/objects/teams/team_season'
    autoload :TeamStatistic, 'sports_api/football/objects/teams/team_statistic'
    autoload :Timezone, 'sports_api/football/objects/timezone'
    autoload :Venue, 'sports_api/football/objects/venue'

    autoload :CoachResource, 'sports_api/football/resources/coach'
    autoload :CountryResource, 'sports_api/football/resources/country'
    autoload :FixtureResource, 'sports_api/football/resources/fixtures/fixture'
    autoload :FixtureEventResource, 'sports_api/football/resources/fixtures/fixture_event'
    autoload :FixtureHeadToHeadResource, 'sports_api/football/resources/fixtures/fixture_head_to_head'
    autoload :FixtureLineupResource, 'sports_api/football/resources/fixtures/fixture_lineup'
    autoload :FixturePlayerStatisticResource, 'sports_api/football/resources/fixtures/fixture_player_statistic'
    autoload :FixtureRoundResource, 'sports_api/football/resources/fixtures/fixture_round'
    autoload :FixtureStatisticResource, 'sports_api/football/resources/fixtures/fixture_statistic'
    autoload :InjuryResource, 'sports_api/football/resources/injury'
    autoload :LeagueResource, 'sports_api/football/resources/leagues/league'
    autoload :LeagueSeasonResource, 'sports_api/football/resources/leagues/league_season'
    autoload :PlayerResource, 'sports_api/football/resources/players/player'
    autoload :PlayerTopAssistResource, 'sports_api/football/resources/players/player_top_assist'
    autoload :PlayerTopScorerResource, 'sports_api/football/resources/players/player_top_scorer'
    autoload :PlayerTopYellowCardResource, 'sports_api/football/resources/players/player_top_yellow_card'
    autoload :PlayerSeasonResource, 'sports_api/football/resources/players/player_season'
    autoload :PlayerSquadResource, 'sports_api/football/resources/players/player_squad'
    autoload :PredictionResource, 'sports_api/football/resources/prediction'
    autoload :StandingResource, 'sports_api/football/resources/standing'
    autoload :TeamCountryResource, 'sports_api/football/resources/teams/team_country'
    autoload :TeamResource, 'sports_api/football/resources/teams/team'
    autoload :TeamSeasonResource, 'sports_api/football/resources/teams/team_season'
    autoload :TeamStatisticResource, 'sports_api/football/resources/teams/team_statistic'
    autoload :TimezoneResource, 'sports_api/football/resources/timezone'
    autoload :VenueResource, 'sports_api/football/resources/venue'
  end
end
