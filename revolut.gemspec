# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revolut/version'

github_repo_url = 'https://github.com/jpalumickas/revolut-ruby'

Gem::Specification.new do |spec|
  spec.name          = 'revolut'
  spec.version       = Revolut::VERSION
  spec.authors       = ['Justas Palumickas']
  spec.email         = ['jpalumickas@gmail.com']

  spec.summary       = 'Ruby wrapper for Revolut API'
  spec.description   = 'Ruby gem for Revolut API'
  spec.homepage      = 'https://github.com/jpalumickas/revolut-ruby'
  spec.license       = 'MIT'
  spec.metadata = {
    'bug_tracker_uri' => "#{github_repo_url}/issues",
    'source_code_uri' => "#{github_repo_url}/tree/v#{Revolut::VERSION}",
    'changelog_uri' => "#{github_repo_url}/releases/tag/v#{Revolut::VERSION}"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'faraday'

  spec.add_dependency 'faraday_middleware', '~> 1.2'
  spec.add_dependency 'hashie', '~> 5.0'

  spec.add_development_dependency 'bundler', '~> 2.3'
  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rubocop', '~> 1.8'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'webmock', '~> 3.14'
end
