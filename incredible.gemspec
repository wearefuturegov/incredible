$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'incredible/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'Incredible'
  s.version     = Incredible::VERSION
  s.authors     = ['pezholio']
  s.email       = ['pezholio@gmail.com']
  s.homepage    = 'http://github.com/wearefuturegov/incredible'
  s.summary     = 'Build multi-page forms like a General'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
