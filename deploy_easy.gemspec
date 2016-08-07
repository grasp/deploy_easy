# -*- coding: utf-8 -*-
require File.expand_path('../lib/deploy_easy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["grasp"]
  gem.email         = ["hunter.wxhu@gmail.com"]
  gem.description   = %q{deploy ruby web app}
  gem.summary       = %q{deploy ruby web app}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "deploy_easy"
  gem.require_paths = ["lib", "app"]
  gem.version       = DeployEasy::VERSION

  gem.add_dependency "padrino-core"
end
