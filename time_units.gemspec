# -*- encoding: utf-8 -*-
require File.expand_path('../lib/time_units/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Julien Ammous"]
  gem.email         = ["schmurfy@gmail.com"]
  gem.summary       = %q{Some time helpers}
  gem.homepage      = "https://github.com/schmurfy/time_units"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.name          = "time_units"
  gem.require_paths = ["lib"]
  gem.version       = TimeUnits::VERSION
end
