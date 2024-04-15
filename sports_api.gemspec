# frozen_string_literal: true

require_relative 'lib/sports_api/version'

Gem::Specification.new do |spec|
  spec.name = 'sports_api'
  spec.version = SportsApi::VERSION
  spec.authors = ['David Sanchez']
  spec.email = ['sanchez.dav90@gmail.com']

  spec.summary = 'Sports API gem to get data from diverse sports.'
  spec.description = 'Sports API gem to get data from diverse sports like soccer, basketball, baseball, etc.'
  spec.homepage = 'https://codeando.dev/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.2'

  spec.metadata['allowed_push_host'] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Sanchezdav/sports_api'
  spec.metadata['changelog_uri'] = 'https://github.com/Sanchezdav/sports_api/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'faraday', '~> 2.9'
  spec.add_development_dependency 'dotenv', '~>3.1'
  spec.add_development_dependency 'rubocop', '~> 1.21'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.35'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
