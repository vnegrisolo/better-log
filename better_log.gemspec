# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_log/version'

Gem::Specification.new do |spec|
  spec.name          = 'better_log'
  spec.version       = BetterLog::VERSION
  spec.authors       = ['Vinicius Ferreira Negrisolo']
  spec.email         = ['vinicius.negrisolo@gmail.com']
  spec.description   = %q{Better Log}
  spec.summary       = %q{Better Log}
  spec.homepage      = 'https://github.com/vnegrisolo/better_log.git'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
