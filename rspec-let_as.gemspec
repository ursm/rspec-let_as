require_relative 'lib/rspec/let_as/version'

Gem::Specification.new do |spec|
  spec.name     = 'rspec-let_as'
  spec.version  = RSpec::LetAs::VERSION
  spec.authors  = ['Keita Urashima']
  spec.email    = ['ursm@ursm.jp']
  spec.summary  = 'Right assignment extension for RSpec'
  spec.homepage = 'https://github.com/ursm/rspec-let_as'
  spec.license  = 'MIT'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = "#{spec.homepage}.git"
  spec.metadata['changelog_uri']   = "#{spec.homepage}/releases"

  spec.files = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*.rb'
  ]

  spec.require_paths = ['lib']

  spec.add_dependency 'binding_of_caller'
  spec.add_dependency 'rspec-core'
end
