$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'incredible/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'incredible'
  s.version     = Incredible::VERSION
  s.authors     = ['pezholio']
  s.email       = ['pezholio@gmail.com']
  s.homepage    = 'http://github.com/wearefuturegov/incredible'
  s.summary     = 'Build multi-page forms like a General'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_dependency 'wicked', '~> 1.3.2'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec_junit_formatter'
  s.add_development_dependency 'coveralls'
end
