# SportsApi

The `sports_api` gem provides a convenient Ruby interface to interact with the [api-sports.io](https://api-sports.io/) sports statistics, live scores, and predictions API. It allows developers to easily integrate sports data into their Ruby applications with minimal effort.

It currently supports the V3 of [api-sports.io](https://api-sports.io/).

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

#### Country

```ruby
client.country.list
client.country.list(search: "Mex")
client.country.find_by_code(code: "MX")
client.country.find_by_name(name: "Mexico")
```

#### League

```ruby
client.league.list
client.league.list(code: "MX", season: 2023)
client.league.find(id: 262)
```

#### League Season

```ruby
client.league_season.list
```

#### Team

```ruby
client.team.list
client.team.list(country: "Mexico")
client.team.find(id: 2287)
```

#### Team Country

```ruby
client.team_country.list
```

#### Team Statistic

```ruby
client.team_statistic.find(league: 39, team: 33, season: 2019)
```

#### Team Season

```ruby
client.team_season.list(team: 2287)
```

#### Timezone

```ruby
client.timezone.list
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment, for example:

```ruby
# Create your client
client = SportsApi::Football::Client.new(api_key: ENV["SPORTS_API_KEY"])

# List all leagues
client.league.list
```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Sanchezdav/sports_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[Sanchezdav/sports_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SportsApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Sanchezdav/sports_api/blob/master/CODE_OF_CONDUCT.md).
