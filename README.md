# hiera-eyaml-rsa

Simple RSA encryption backend for use with [hiera-eyaml](https://github.com/voxpupuli/hiera-eyaml).

## Motivation

The default PKCS#7 encryption scheme used by hiera-eyaml is… awkward.  Just use plain RSA keys, don't wrap them in X.509 certificates that also need a *subject*, an *issuer*, *not before* and *not after* dates.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hiera-eyaml-rsa

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hiera-eyaml-rsa

## Usage

Create an RSA key:

    $ eyaml createkeys -n rsa

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/smortex/hiera-eyaml-rsa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/smortex/hiera-eyaml-rsa/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hiera::Eyaml::Rsa project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/smortex/hiera-eyaml-rsa/blob/main/CODE_OF_CONDUCT.md).
