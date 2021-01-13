# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "musicz/version"

Gem::Specification.new do |spec|
  spec.name = "musicz"
  spec.version = Musicz::VERSION
  spec.authors = ["Derrick Plotsky"]
  spec.email = ["derrickplotsky@gmail.com"]

  spec.summary = "Basic wrapper around musicbrainz"
  spec.description = "A very basic wrapper around the nusicbrainz API"
  spec.homepage = "https://github.com/derrickp/musicz"
  spec.license = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/derrickp/musicz"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-struct"
  spec.add_dependency "dry-types"
  spec.add_dependency "typhoeus"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "vcr"
end
