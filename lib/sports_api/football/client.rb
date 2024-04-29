# frozen_string_literal: true

require 'faraday'

module SportsApi
  module Football
    # rubocop:disable Metrics/ClassLength
    class Client
      BASE_URL = 'https://v3.football.api-sports.io/'

      attr_reader :api_key, :adapter

      def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
        @api_key = api_key
        @adapter = adapter

        # Test stubs for requests
        @stubs = stubs
      end

      def coaches
        CoachResource.new(self)
      end

      def countries
        CountryResource.new(self)
      end

      def fixtures
        FixtureResource.new(self)
      end

      def fixture_rounds
        FixtureRoundResource.new(self)
      end

      def fixture_head_to_head
        FixtureHeadToHeadResource.new(self)
      end

      def fixture_statistics
        FixtureStatisticResource.new(self)
      end

      def fixture_events
        FixtureEventResource.new(self)
      end

      def fixture_lineups
        FixtureLineupResource.new(self)
      end

      def fixture_player_statistics
        FixturePlayerStatisticResource.new(self)
      end

      def injuries
        InjuryResource.new(self)
      end

      def leagues
        LeagueResource.new(self)
      end

      def league_seasons
        LeagueSeasonResource.new(self)
      end

      def odds
        OddsResource.new(self)
      end

      def odds_bets
        OddsBetResource.new(self)
      end

      def odds_bookmakers
        OddsBookmakerResource.new(self)
      end

      def odds_lives
        OddsLiveResource.new(self)
      end

      def odds_live_bets
        OddsLiveBetResource.new(self)
      end

      def odds_mappings
        OddsMappingResource.new(self)
      end

      def players
        PlayerResource.new(self)
      end

      def player_top_assists
        PlayerTopAssistResource.new(self)
      end

      def player_top_scorers
        PlayerTopScorerResource.new(self)
      end

      def player_top_red_cards
        PlayerTopRedCardResource.new(self)
      end

      def player_top_yellow_cards
        PlayerTopYellowCardResource.new(self)
      end

      def player_seasons
        PlayerSeasonResource.new(self)
      end

      def player_squads
        PlayerSquadResource.new(self)
      end

      def predictions
        PredictionResource.new(self)
      end

      def sidelined
        SidelinedResource.new(self)
      end

      def standings
        StandingResource.new(self)
      end

      def teams
        TeamResource.new(self)
      end

      def team_countries
        TeamCountryResource.new(self)
      end

      def team_seasons
        TeamSeasonResource.new(self)
      end

      def team_statistics
        TeamStatisticResource.new(self)
      end

      def timezones
        TimezoneResource.new(self)
      end

      def transfers
        TransferResource.new(self)
      end

      def trophies
        TrophyResource.new(self)
      end

      def venues
        VenueResource.new(self)
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = BASE_URL
          conn.request :json
          conn.response :json, content_type: 'application/json'
          conn.adapter adapter, @stubs
        end
      end

      def inspect
        '#<SportsApi::Football::Client>'
      end
    end
    # rubocop:enable Metrics/ClassLength
  end
end
