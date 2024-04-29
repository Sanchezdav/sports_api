# SportsApi

The `sports_api` gem provides a convenient Ruby interface to interact with the [api-sports.io](https://api-sports.io/) sports statistics, live scores, and predictions API. It allows developers to easily integrate sports data into their Ruby applications with minimal effort.

It currently supports the V3 of [api-sports.io](https://api-sports.io/).

## Getting Started

The best starting point is the [Sports API Website](https://sanchezdav.github.io/sports_api/#/), with its introduction and explanation.

## Features

- Access to a wide range of sports statistics, including live scores and predictions.
- Simple and intuitive API wrapper for seamless integration into Ruby projects.
- Supports various sports categories such as football, basketball, baseball, and more.
- Easy-to-use methods for fetching data.

## Installation

Add this line to your application's Gemfile:

    gem 'sports_api', github: "Sanchezdav/sports_api"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sports_api


## Usage

To access the API, you'll need to create a client and pass in your API key. You can find your API key at [https://dashboard.api-football.com/profile](https://dashboard.api-football.com/profile?access), example:

```ruby
client = SportsApi::Football::Client.new(api_key: ENV["SPORTS_API_KEY"])
```

The client then gives you access to each of the resources.

## Resources

The gem maps as closely as we can to the Sports API so you can easily convert API examples to gem code.

Responses are created as objects like `SportsApi::Football::League`. They're built using OpenStruct so you can easily access data in a Ruby-ish way.

### Football

#### Coach

```ruby
client.coaches.list(search: 'Tuchel')
client.coaches.find(id: 40)
```

#### Country

```ruby
client.countries.list
client.countries.list(search: "Mex")
client.countries.find_by_code(code: "MX")
client.countries.find_by_name(name: "Mexico")
```

#### Fixture

```ruby
client.fixtures.list(live: "all", league: 262)
client.fixtures.find(id: 1187546)
```

#### Fixture Round

```ruby
client.fixture_rounds.list(league: 262, season: 2023)
```

#### Fixture Head to Head

```ruby
client.fixture_head_to_head.list(h2h: "2287-2278")
```

#### Fixture Statistic

```ruby
client.fixture_statistics.list(fixture: '463')
```

#### Fixture Event

```ruby
client.fixture_events.list(fixture: '215662')
```

#### Fixture Lineup

```ruby
client.fixture_lineups.list(fixture: '592872')
```

#### Fixture Player Statistic

```ruby
client.fixture_player_statistics.list(fixture: '169080', team: 2284)
```

#### Injury

```ruby
client.injuries.list(fixture: '686314')
```

#### League

```ruby
client.leagues.list
client.leagues.list(code: "MX", season: 2023)
client.leagues.find(id: 262)
```

#### League Season

```ruby
client.league_seasons.list
```

#### Odds

```ruby
client.odds.list(fixture: '326090', bookmaker: 6)
```

#### Odds Bet

```ruby
client.odds_bets.list(search: 'under')
client.odds_bets.find(id: 1)
```

#### Odds Bookmaker

```ruby
client.odds_bookmakers.list
client.odds_bookmakers.find(id: 8)
```

#### Odds Live

```ruby
client.odds_lives.list(fixture: '721238')
```

#### Odds Live Bet

```ruby
client.odds_live_bets.list
client.odds_live_bets.find(id: 1)
```

#### Odds Mapping

```ruby
client.odds_mappings.list
```

#### Player

```ruby
client.players.list(team: 2287, season: 2023)
client.players.list(id: 35603, season: 2023)
```

#### Player Season

```ruby
client.player_seasons.list
client.player_seasons.list(player: 276)
```

#### Player Squad

```ruby
client.player_squads.list(team: 33)
```

#### Player Top Assist

```ruby
client.player_top_assists.list(league: 262, season: 2023)
```

#### Player Top Scorer

```ruby
client.player_top_scorers.list(league: 262, season: 2023)
```

#### Player Top Red Card

```ruby
client.player_top_red_cards.list(league: 262, season: 2023)
```

#### Player Top Yellow Card

```ruby
client.player_top_yellow_cards.list(league: 262, season: 2023)
```

#### Prediction

```ruby
client.predictions.list(fixture: '198772')
```

#### Sidelined

```ruby
client.sidelined.list(player: 35603)
```

#### Standing

```ruby
client.standings.list(season: 2023, team: 2287)
```

#### Team

```ruby
client.teams.list
client.teams.list(country: "Mexico")
client.teams.find(id: 2287)
```

#### Team Country

```ruby
client.team_countries.list
```

#### Team Statistic

```ruby
client.team_statistics.find(league: 39, team: 33, season: 2019)
```

#### Team Season

```ruby
client.team_seasons.list(team: 2287)
```

#### Timezone

```ruby
client.timezones.list
```

#### Transfer

```ruby
client.transfers.list(team: 2287)
```

#### Trophy

```ruby
client.trophies.list(player: 35603)
```

#### Venue

```ruby
client.venues.list(search: "Mex")
client.venues.find(id: 556)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment, for example:

```ruby
# Create your client
client = SportsApi::Football::Client.new(api_key: ENV["SPORTS_API_KEY"])

# List all leagues
client.leagues.list
```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Documentation Site

To run the documentation site locally you have to run `docsify serve docs` and you can check all the content within the `./docs` folder.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Sanchezdav/sports_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Sanchezdav/sports_api/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SportsApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Sanchezdav/sports_api/blob/main/CODE_OF_CONDUCT.md).
