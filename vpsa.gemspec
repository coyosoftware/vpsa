# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vpsa/version'

Gem::Specification.new do |spec|
  spec.name          = "vpsa"
  spec.version       = Vpsa::VERSION
  spec.authors       = ["Gustavo Berdugo"]
  spec.email         = ["gberdugo@gmail.com"]
  spec.summary       = %q{This gem provides integration with VPSA APIs (http://www.vpsa.com.br/)}
  spec.description   = %q{The goal of this gem is to simplify the access to VPSA API (http://www.vpsa.com.br/), for more information about this API, visit: https://github.com/VPSA/api/wiki/}
  spec.homepage      = "https://github.com/coyosoftware/vpsa"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('httparty', "~> 0.13")
  spec.add_development_dependency "bundler", "~> 1.7"

  spec.post_install_message = <<-MESSAGE
  !    The 'vpsa' gem has been deprecated and has been replaced by 'varejonline'.
  !    See: https://rubygems.org/gems/varejonline
  !    And: https://github.com/coyosoftware/varejonline
  MESSAGE
end
