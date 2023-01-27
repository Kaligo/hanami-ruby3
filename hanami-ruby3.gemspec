require_relative 'lib/hanami/ruby3/version'

Gem::Specification.new do |spec|
  spec.name = "hanami-ruby3"
  spec.version = Hanami::Ruby3::VERSION
  spec.authors = ["Ascenda Developers"]
  spec.email = ["developers@ascendaloyalty.com"]

  spec.summary = "Set of component overrides for Hanami 1.3.X to support Ruby 3.0"
  spec.description = "Set of component overrides for Hanami 1.3.X to support Ruby 3.0"
  spec.homepage = "http://github.com/Kaligo/hanami-ruby3"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.6")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/Kaligo/hanami-ruby3"
  spec.metadata["changelog_uri"] = "http://github.com/Kaligo/hanami-ruby3/releases"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["github_repo"] = "ssh://github.com/Kaligo/hanami-ruby3"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "hanami", "1.3.4"
end
