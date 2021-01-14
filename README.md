# Musicz
![Specs](https://github.com/derrickp/musicz/workflows/Specs/badge.svg)

This will be a basic wrapper around the musicbrainz search API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'musicz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install musicz

## Usage

Since it's still early stages, most things are not done, even the convenience methods.

But basic usage

```ruby
require 'musicz'

Musicz.configure do |config|
  config.app_name = 'APP_NAME'
  config.contact = 'CONTACT_INFO'
end

artist_repo = Musicz::Search::ArtistRepository.new

# Search by ID
id_options = Musicz::Search::Options::IdSearch.new(id: 'ID')
artist = artist_repo.by_id(id_options)

# Search by term
term = 'SOME_BAND_NAME'
artist_list = artist_repo.by_term(term)
```

Want to find an artist by term and then get some related information?

```ruby
artist_repo = Musicz::Search::ArtistRepository.new
artist_list = artist_repo.by_term('A_BAND_NAME')
artist = artist_list.artists.first # Or get the one with the highest score
id_options = Musicz::Search::Options::IdSearch.new(id: artist.id, relationships: ['releases'])
full_artist = artist_repo.by_id(id_options)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/derrickp/musicz. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Musicz project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/derrickp/musicz/blob/master/CODE_OF_CONDUCT.md).
