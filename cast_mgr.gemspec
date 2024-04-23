# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/cast_mgr', __FILE__)

require File.expand_path('../lib/cast_mgr/roles', __FILE__)
require File.expand_path('../lib/cast_mgr/rights', __FILE__)
require File.expand_path('../lib/cast_mgr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'cast_mgr'
  gem.version       = CastMgr::VERSION
  gem.authors       = ['Adibex']
  gem.email         = ['bialasa@gmail.com']
  gem.description   = 'Cast Manager - roles and rights system'
  gem.summary       = 'Cast Manager'
  gem.homepage      = 'http://gitlab/nokaut_utils/tree/master'

  gem.files = Dir["#{File.dirname(__FILE__)}/**/*"]
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'minitest', '~> 5.1'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'rspec-support'
  gem.add_development_dependency 'rack'
end
