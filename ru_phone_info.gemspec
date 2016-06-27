# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ru_phone_info/version'

Gem::Specification.new do |spec|
  spec.name          = "ru_phone_info"
  spec.version       = RuPhoneInfo::VERSION
  spec.authors       = ["b0nn1e"]
  spec.email         = ["andrey.b0nn1e@gmail.com"]

  spec.summary       = %q{Get region by rus mobile phone}
  spec.homepage      = "https://github.com/Actie/ru_phone_info"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
