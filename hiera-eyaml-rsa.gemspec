# frozen_string_literal: true

require_relative "lib/hiera/backend/eyaml/encryptors/rsa/version"

Gem::Specification.new do |spec|
  spec.name = "hiera-eyaml-rsa"
  spec.version = Hiera::Backend::Eyaml::Encryptors::RsaVersion::VERSION
  spec.authors = ["Romain Tartière"]
  spec.email = ["romain@blogreen.org"]

  spec.summary = "Simple RSA encryptor for use with hiera-eyaml"
  spec.description = "Encryption plugin for hiera-eyaml backend for Hiera using simple RSA keys"
  spec.homepage = "https://github.com/smortex/hiera-eyaml-rsa"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hiera-eyaml", ">= 3.0", "< 5.0"

  spec.add_development_dependency "aruba"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "github_changelog_generator"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rake"
end
