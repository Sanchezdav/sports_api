# Resources <!-- {docsify-ignore} -->

The gem maps as closely as we can to the Sports API so you can easily convert API examples to gem code.

Responses are created as objects like `SportsApi::Football::League`. They're built using OpenStruct so you can easily access data in a Ruby-ish way.

## Football <!-- {docsify-ignore} -->

### Coach

Obtain comprehensive details about the coaches and their professional trajectories.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The coach ID.                            |
| team      | Integer  | -        | The team ID.                             |
| search    | String   | -        | The name of the coach [>= 3 characters]. |

**Examples**

_List coaches by team_
```ruby
client.coaches.list(team: 2287)
```

_Search coaches by name_
```ruby
client.coaches.list(search: 'Tuchel')
```

_Find a single coach by ID_
```ruby
client.coaches.find(id: 40)
```

### Country

Retrieve the roster of countries accessible via the leagues endpoint.
All the parameters of this endpoint can be used together.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| name      | String   | -        | The name of the country.                 |
| code      | String   | -        | The country code [2-3 characters].       |
| search    | String   | -        | The name of the country [>= 3 characters]. |

**Examples**

_Get all the available countries_
```ruby
client.countries.list
```

_Search countries by name_
```ruby
client.countries.list(search: "Mex")
```

_Find the first country that matches with the code_
```ruby
client.countries.find_by_code(code: "MX")
```

_Find the first country that matches with the name_
```ruby
client.countries.find_by_name(name: "Mexico")
```

### Fixture

Retrieve the list of matches.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The fixture ID.                           |
| ids       | String   | -        | One or more fixture IDs ["id-id-id"].       |
| live      | String   | -        | All or several leagues ids ["all", "id-id"]. |
| date      | String   | -        | The date of the fixture ["YYYY-MM-DD"].   |
| league    | Integer  | -        | The league ID.                           |
| season    | Integer  | -        | The season year [YYYY].                  |
| last      | Integer  | -        | For the X last fixtures [<= 2 characters]. |
| next      | Integer  | -        | For the X next fixtures [<= 2 characters]. |
| from      | String   | -        | A valid date ["YYYY-MM-DD"].              |
| to        | String   | -        | A valid date ["YYYY-MM-DD"].              |
| round     | String   | -        | The round of the fixture.                  |
| status    | String   | -        | One or more fixture status short ["NS", "NS-PST-FT", etc.]. |
| venue     | Integer  | -        | The venue ID.                             |
| timezone  | String   | -        | A valid timezone from the endpoint `Timezone`. |

**Examples**

_Retrieve a list of fixtures_
```ruby
client.fixtures.list(live: "all", league: 262)
```

_Retrieve a list of fixtures by IDs_
```ruby
client.fixtures.list(ids: "215662-215663-215664-215665-215666-215667")
```

_Get a single fixture by ID_
```ruby
client.fixtures.find(id: 1187546)
```

### Fixture Round

Retrieve the rounds or stages of a league or cup.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season year of the league [YYYY].    |
| current   | Boolean  | -        | The current round ["true", "false"].     |

**Examples**

_Retrieve the fixture rounds by league and season_
```ruby
client.fixture_rounds.list(league: 262, season: 2023)
```

_Retrieve the fixture rounds by league, season and the current one_
```ruby
client.fixture_rounds.list(league: 262, season: 2023, current: "true")
```

### Fixture Head to Head

Get heads to heads between two teams.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| h2h       | String   | ✅       | The ids of the teams ["id-id"].           |
| date      | String   | -        | A valid date [YYYY-MM-DD].                |
| league    | Integer  | -        | The league ID.                            |
| season    | Integer  | -        | The season year of the league [YYYY].     |
| last      | Integer  | -        | For the X last fixtures [<= 2 characters]. |
| next      | Integer  | -        | For the X next fixtures [<= 2 characters]. |
| from      | String   | -        | A valid date ["YYYY-MM-DD"].              |
| to        | String   | -        | A valid date ["YYYY-MM-DD"].              |
| status    | String   | -        | One or more fixture status short ["NS", "NS-PST-FT", etc.]. |
| venue     | Integer  | -        | The venue ID.                             |
| timezone  | String   | -        | A valid timezone from the endpoint `Timezone`. |

**Examples**

_Retrieve head to head data between two teams_
```ruby
client.fixture_head_to_head.list(h2h: "2287-2278")
```

_Retrieve head to head data between two teams by date_
```ruby
client.fixture_head_to_head.list(h2h: "2287-2278", date: "2019-10-22")
```

_Retrieve head to head data between two teams in a timezone_
```ruby
client.fixture_head_to_head.list(h2h: "2287-2278", timezone: "Europe/Londo")
```

### Fixture Statistic

Retrieve the detailed metrics for a specific match.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | ✅       | The fixture ID.                           |
| team      | Integer  | -        | The team ID.                             |
| type      | String   | -        | The type of statistics ["Shots on Goal", "Corner Kicks", etc]. |

**Examples**

_Retrieve the statistics for one fixture_
```ruby
client.fixture_statistics.list(fixture: 215662)
```

_Retrieve the statistics for a fixture, by team and by a type_
```ruby
client.fixture_statistics.list(fixture: 215662, team: 463, type: "Total Shots")
```

### Fixture Event

Retrieve the occurrences or incidents associated with a specific match.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | ✅       | The fixture ID.                           |
| team      | Integer  | -        | The team ID.                             |
| player    | Integer  | -        | The team ID.                             |
| type      | String   | -        | The type of the event ["Goal", "Card", "Subst", "Var"]. |

**Examples**

_Retrieve the events for a fixture_
```ruby
client.fixture_events.list(fixture: 215662)
```

_Retrieve the card events for a fixture_
```ruby
client.fixture_events.list(fixture: 215662, type: "card")
```

_Retrieve the events for a fixture by player_
```ruby
client.fixture_events.list(fixture: 215662, player: 35845)
```

### Fixture Lineup

Retrieve the player formations for a specific match.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | ✅       | The fixture ID.                           |
| team      | Integer  | -        | The team ID.                             |
| player    | Integer  | -        | The team ID.                             |
| type      | String   | -        | The type of the event ["Formation", "Coach", "Start XI", "Substitutes"]. |

**Examples**

_Retrive the lineups of a match_
```ruby
client.fixture_lineups.list(fixture: 592872)
```

_Retrive the lineups of a team in a match_
```ruby
client.fixture_lineups.list(fixture: 592872, team: 50)
```

_Retrive the lineups of a match by type_
```ruby
client.fixture_lineups.list(fixture: 592872, type: "startXI")
```

### Fixture Player Statistic

Retrieve metrics of players from a specific match.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | ✅       | The fixture ID.                           |
| team      | Integer  | -        | The team ID.                             |

**Examples**

_Retrieve the players statistics from one fixture_
```ruby
client.fixture_player_statistics.list(fixture: 169080)
```

_Retrieve the players statistics from one fixture and of a team_
```ruby
client.fixture_player_statistics.list(fixture: 169080, team: 2284)
```

### Injury

Retrieve the roster of players who are unavailable for fixtures due to reasons such as suspensions or injuries.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | -        | The fixture ID.                           |
| team      | Integer  | -        | The team ID.                             |
| league    | Integer  | -        | The league ID.                           |
| player    | Integer  | -        | The player ID.                           |
| season    | Integer  | -        | The season of the league, required with `league`, `team` and `player` parameters [YYYY]. |
| date      | String   | -        | A valid date [YYYY-MM-DD].               |
| timezone  | String   | -        | A valid timezone from the endpoint `Timezone`. |

**Examples**

_Retrieve the injuries of a match_
```ruby
client.injuries.list(fixture: 686314)
```

_Retrieve the injuries of a match by team and from a season_
```ruby
client.injuries.list(fixture: 686314, team: 85, season: 2020)
```

### League

Retrieve the roster of accessible leagues and cups.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The league ID.                           |
| team      | Integer  | -        | The team ID.                             |
| name      | String   | -        | The name of the league.                  |
| country   | String   | -        | The country name of the league.          |
| code      | String   | -        | The Alpha2 code of the country ["MX", "FR", etc]. |
| season    | Integer  | -        | The season of the league [YYYY].         |
| type      | String   | -        | The type of the league ["league", "cup"]. |
| current   | String   | -        | The state of the league ["true", "false"]. |
| search    | String   | -        | The name or the country of the league [>= 3 characters]. |
| last      | Integer  | -        | The X last leagues/cups added in the API [<= 2 characters]. |

**Examples**

_Retrieve leagues by name_
```ruby
client.leagues.list(name: "premier league")
```

_Retrieve leagues by country and season_
```ruby
client.leagues.list(code: "MX", season: 2023)
```

_Get a league by ID_
```ruby
client.leagues.find(id: 262)
```

_Retrieve all leagues where the season is in progress or not_
```ruby
client.leagues.list(current: "true")
```

### League Season

Retrieve the catalog of seasons that are available.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| -         | -        | -        | -                                        |

**Examples**

_Retrieve all the available seasons_
```ruby
client.league_seasons.list
```

### Odds

Retrieve betting odds associated with fixtures, leagues, or specific dates.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | -        | The fixture ID.                           |
| league    | Integer  | -        | The league ID.                           |
| bet       | Integer  | -        | The bet ID.                              |
| bookmaker | Integer  | -        | The bookmaker ID.                        |
| season    | Integer  | -        | The season of the league [YYYY].         |
| date      | String   | -        | A valid date [YYYY-MM-DD].               |
| timezone  | String   | -        | A valid timezone from the endpoint `Timezone`. |
| page      | Integer  | -        | Use for the pagination [default 1].      |

**Examples**

_Retrieve all available odds from a match_
```ruby
client.odds.list(fixture: 164327)
```

_Retrieve all available odds from a match and a bookmaker_
```ruby
client.odds.list(fixture: 164327, bookmaker: 6)
```

_Retrieve all odds from a date_
```ruby
client.odds.list(date: "2020-05-15")
```

### Odds Bet

Retrieve all available bets for pre-match odds.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The bet name ID.                         |
| search    | String   | -        | The name of the bet [>= 3 characters].   |

**Examples**

_Retrieve all the available bets by name_
```ruby
client.odds_bets.list(search: "winner")
```

_Get a bet by ID_
```ruby
client.odds_bets.find(id: 1)
```

### Odds Bookmaker

Retrieve the list of all accessible bookmakers.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The bookmaker ID.                        |
| search    | String   | -        | The name of the bookmaker [>= 3 characters]. |

**Examples**

_Retrieve all available bookmakers_
```ruby
client.odds_bookmakers.list
```

_Retrieve bookmakers by name_
```ruby
client.odds_bookmakers.list(search: "Bet365")
```

_Get a bookmaker by ID_
```ruby
client.odds_bookmakers.find(id: 8)
```

### Odds Live

Retrieve in-play betting odds for ongoing matches.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | -        | The fixture ID.                           |
| league    | Integer  | -        | The league ID.                           |
| bet       | Integer  | -        | The bet ID.                              |

**Examples**

_Retrieve all available in-play odds_
```ruby
client.odds_lives.list
```

_Retrieve all available in-play odds from a match_
```ruby
client.odds_lives.list(fixture: 721238)
```

_Retrieve all available in-play odds from a league_
```ruby
client.odds_lives.list(league: 262)
```

### Odds Live Bet

Retrieve all available bets for in-play odds.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The bet name ID.                         |
| search    | String   | -        | The name of the bet   [>= 3 characters]. |

**Examples**

_Retrieve all available bets_
```ruby
client.odds_live_bets.list
```

_Get a bet by ID_
```ruby
client.odds_live_bets.find(id: 1)
```

_Retrieve all available bets by name_
```ruby
client.odds_live_bets.list(search: "winner")
```

### Odds Mapping

Retrieve the list of available fixtures ID for the endpoint odds.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| page      | Integer  | -        | Use for the pagination [default 1].      |

**Examples**

_Retrieve the available fixtures for the odds endpoint_
```ruby
client.odds_mappings.list
```

### Player

Retrieve all the player info and statistics.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The player ID.                           |
| team      | Integer  | -        | The team ID.                             |
| league    | Integer  | -        | The league ID.                           |
| season    | Integer  | -        | The season of the league [YYYY].         |
| search    | String   | -        | The name of the player [>= 3 characters]. |
| page      | Integer  | -        | Use for the pagination [default 1].      |

**Examples**

_Retrieve player data from a team and a season_
```ruby
client.players.list(team: 2287, season: 2023)
```

_Retrieve player data by name and a season_
```ruby
client.players.list(search: "cavani", season: 2018)
```

### Player Top Assist

Retrieve the top 20 players with the most assists in a league or cup.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season of the league [YYYY].         |

**Examples**

_Retrieve the 20 best player assists for a specific league and season_
```ruby
client.player_top_assists.list(league: 262, season: 2023)
```

### Player Top Scorer

Retrieve the top 20 players with the highest scoring records for a league or cup.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season of the league [YYYY].         |

**Examples**

_Retrieve the 20 best player scorers for a specific league and season_
```ruby
client.player_top_scorers.list(league: 262, season: 2023)
```

### Player Top Red Card

Retrieve the top 20 players with the highest number of red cards in a league or cup.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season of the league [YYYY].         |

**Examples**

_Retrieve the 20 players with the highest number of red cards by league and season_
```ruby
client.player_top_red_cards.list(league: 262, season: 2023)
```

### Player Top Yellow Card

Retrieve the top 20 players with the highest number of yellow cards in a league or cup.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season of the league [YYYY].         |

**Examples**

_Retrieve the 20 players with the highest number of yellow cards by league and season_
```ruby
client.player_top_yellow_cards.list(league: 262, season: 2023)
```

### Player Season

Retrieve the list of all seasons for which player statistics are available.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season of the league [YYYY].         |

**Examples**

_Retrieve all the available seasons for player statistics_
```ruby
client.player_seasons.list
```

_Retrieve all the available seasons by player_
```ruby
client.player_seasons.list(player: 276)
```

### Player Squad

Retrieve the current roster of a team when queried with the team parameter. When queried with the player parameter, the endpoint returns the collection of teams affiliated with the player.

This endpoint requires at least one parameter.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| team      | Integer  | -        | The team ID.                             |
| player    | Integer  | -        | The player.                              |

**Examples**

_Retrieve the current squad of a team_
```ruby
client.player_squads.list(team: 2287)
```

_Retrieve the associated teams for a player_
```ruby
client.player_squads.list(player: 35603)
```

### Prediction

Retrieve predictions outcomes for a specific match.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| fixture    | Integer  | ✅       | The fixture ID.                           |

**Examples**

_Retrieve the predictions for a specific match_
```ruby
client.predictions.list(fixture: 198772)
```

### Sidelined

Retrieve all available sidelined for a player or a coach.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| player    | Integer  | -        | The player ID.                           |
| coach     | Integer  | -        | The coach ID.                            |

**Examples**

_Retrieve the available sidelined for a specific player_
```ruby
client.sidelined.list(player: 35603)
```

_Retrieve the available sidelined for a specific coach_
```ruby
client.sidelined.list(coach: 2)
```

### Standing

Retrieve the league or team rankings.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| season    | Integer  | ✅       | The season of the league [YYYY].         |
| league    | Integer  | -        | The league ID.                           |
| team      | Integer  | -        | The team  ID.                            |

**Examples**

_Retrieve the team standings by season_
```ruby
client.standings.list(season: 2023, team: 2287)
```

_Retrieve the league standings by season_
```ruby
client.standings.list(season: 2023, league: 262)
```

### Team

Retrieve the list of accessible teams.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The player ID.                           |
| name      | String   | -        | The name of the team.                    |
| league    | Integer  | -        | The league ID.                           |
| season    | Integer  | -        | The season of the league [YYYY].         |
| country   | String   | -        | The country name of the team.            |
| code      | String   | -        | The country code [2-3 characters].       |
| venue     | Integer  | -        | The venue ID.                            |
| search    | String   | -        | The name or the country name of the team [>= 3 characters]. |

**Examples**

_Retrieve teams by name_
```ruby
client.teams.list(name: "manchester united")
```

_Retrive teams by country_
```ruby
client.teams.list(country: "Mexico")
```

_Retrive teams by league and season_
```ruby
client.teams.list(league: 262, season: 2023)
```

_Search teams_
```ruby
client.teams.list(search: "real")
```

_Get a team by ID_
```ruby
client.teams.find(id: 2287)
```

### Team Country

Retrieve the list of countries available for the teams endpoint.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| -         | -        |          | -                                        |

**Examples**

_Retrieve the available countries list for teams_
```ruby
client.team_countries.list
```

### Team Season

Retrieve the catalog of seasons in which a team has participated.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| team      | Integer  | ✅       | The team ID.                             |

**Examples**

_Retrieve the seasons in which the team has participated_
```ruby
client.team_seasons.list(team: 2287)
```

### Team Statistic

Retrieve the performance metrics of a team for a specific competition and season.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| team      | Integer  | ✅       | The team ID.                             |
| league    | Integer  | ✅       | The league ID.                           |
| season    | Integer  | ✅       | The season of the league [YYYY].         |
| date      | String   | -        | The limit date ["YYYY-MM-DD"].           |

**Examples**

_Retrieve statistics for a tema in an specific league and season_
```ruby
client.team_statistics.find(league: 262, team: 2287, season: 2023)
```

### Timezone

Retrieve the catalog of time zones that can be utilized in the fixtures endpoint.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| -         | -        |          | -                                        |

**Examples**

_Retrieve the available timezones_
```ruby
client.timezones.list
```

### Transfer

Retrieve the catalog of player and team transfers.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| team      | Integer  | -        | The team ID.                             |
| player    | Integer  | -        | The player ID.                           |

**Examples**

_Retrieve the transfers for a team_
```ruby
client.transfers.list(team: 2287)
```

_Retrieve the transfers for a players_
```ruby
client.transfers.list(player: 35603)
```

### Trophy

Retrieve the catalog of all trophies won by a player or a coach.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| player    | Integer  | -        | The player ID.                           |
| coach     | Integer  | -        | The coach ID.                            |

**Examples**

_Retrieve the trophies list from a player_
```ruby
client.trophies.list(player: 35603)
```

_Retrieve the trophies list from a coach_
```ruby
client.trophies.list(coach: 2)
```

### Venue

Retrieve the catalog of accessible venues.

**Query Parameters**

| Parameter | Type     | Required | Description                              |
|-----------|----------|----------|------------------------------------------|
| id        | Integer  | -        | The venue ID.                            |
| name      | String   | -        | The name of the venue.                   |
| city      | String   | -        | The city of the venue.                   |
| country   | String   | -        | The country name of the venue.           |
| search    | String   | -        | The name, city or the country of the venue [>= 3 characters]. |

**Examples**

_Retrieve the venues from a country_
```ruby
client.venues.list(search: "Mex")
```

_Retrieve the venues by name_
```ruby
client.venues.list(name: "Old Trafford")
```

_Retrieve the venues by city_
```ruby
client.venues.list(city: "Manchester")
```

_Get the venue by ID_
```ruby
client.venues.find(id: 556)
```
