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

      def coach
        CoachResource.new(self)
      end

      def country
        CountryResource.new(self)
      end

      def fixture
        FixtureResource.new(self)
      end

      def fixture_round
        FixtureRoundResource.new(self)
      end

      def fixture_head_to_head
        FixtureHeadToHeadResource.new(self)
      end

      def fixture_statistic
        FixtureStatisticResource.new(self)
      end

      def fixture_event
        FixtureEventResource.new(self)
      end

      def fixture_lineup
        FixtureLineupResource.new(self)
      end

      def fixture_player_statistic
        FixturePlayerStatisticResource.new(self)
      end

      def injury
        InjuryResource.new(self)
      end

      def league
        LeagueResource.new(self)
      end

      def league_season
        LeagueSeasonResource.new(self)
      end

      def odds
        OddsResource.new(self)
      end

      def odds_bookmaker
        OddsBookmakerResource.new(self)
      end

      def odds_live
        OddsLiveResource.new(self)
      end

      def odds_live_bet
        OddsLiveBetResource.new(self)
      end

      def odds_mapping
        OddsMappingResource.new(self)
      end

      def player
        PlayerResource.new(self)
      end

      def player_top_assist
        PlayerTopAssistResource.new(self)
      end

      def player_top_scorer
        PlayerTopScorerResource.new(self)
      end

      def player_top_red_card
        PlayerTopRedCardResource.new(self)
      end

      def player_top_yellow_card
        PlayerTopYellowCardResource.new(self)
      end

      def player_season
        PlayerSeasonResource.new(self)
      end

      def player_squad
        PlayerSquadResource.new(self)
      end

      def prediction
        PredictionResource.new(self)
      end

      def sidelined
        SidelinedResource.new(self)
      end

      def standing
        StandingResource.new(self)
      end

      def team
        TeamResource.new(self)
      end

      def team_statistic
        TeamStatisticResource.new(self)
      end

      def team_season
        TeamSeasonResource.new(self)
      end

      def team_country
        TeamCountryResource.new(self)
      end

      def timezone
        TimezoneResource.new(self)
      end

      def transfer
        TransferResource.new(self)
      end

      def trophy
        TrophyResource.new(self)
      end

      def venue
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
