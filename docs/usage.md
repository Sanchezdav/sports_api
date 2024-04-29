# Usage <!-- {docsify-ignore} -->

To access the API, you'll need to create a client and pass in your API key. You can find your API key at [https://dashboard.api-football.com/profile](https://dashboard.api-football.com/profile?access), example:

```ruby
client = SportsApi::Football::Client.new(api_key: ENV["SPORTS_API_KEY"])
```

The client then gives you access to each of the resources, for example:

```ruby
client.coaches.list(search: 'Tuchel')
```
