# frozen_string_literal: true

module SportsApi
  module Football
    class TeamStatisticResource < Resource
      # Arguments:
      # league: [String](required) - The league ID.
      # season: [String](required) - The season year (= YYYY).
      # team: [String](required) - The team ID.
      # date: [String](optional) - The limit date (YYYY-MM-DD).
      def find(league:, season:, team:, date: nil)
        params = {
          league: league.to_s,
          season: season.to_s,
          team: team.to_s
        }
        params[:date] = date.to_s if date

        response = get_request('teams/statistics', params:)
        SportsApi::Football::TeamStatistic.new(response.body['response'])
      end
    end
  end
end
