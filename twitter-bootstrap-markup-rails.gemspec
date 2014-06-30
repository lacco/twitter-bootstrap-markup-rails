# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitter-bootstrap-markup-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Usewicz"]
  gem.email         = ["piotr@layer22.com"]
  gem.description   = %q{Ruby on Rails helpers for Bootstrap 2.0 - HTML, CSS, and JS toolkit from Twitter}
  gem.summary       = %q{Ruby on Rails helpers for Bootstrap 2.0 - HTML, CSS, and JS toolkit from Twitter}
  gem.homepage      = "http://pusewicz.github.com/twitter-bootstrap-markup-rails"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "twitter-bootstrap-markup-rails"
  gem.require_paths = ["lib"]
  gem.version       = Twitter::Bootstrap::Markup::Rails::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_dependency "railties", "~> 4.0"
  gem.add_development_dependency "rspec-rails"
  gem.add_development_dependency "rspec-html-matchers"
  gem.add_development_dependency "simple-navigation"
end
