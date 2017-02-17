# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kibana_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "kibana_logger"
  spec.version       = KibanaLogger::VERSION
  spec.authors       = ["Tulino, Ryan"]
  spec.email         = ["rtulino@ebay.com"]

  spec.description   = %q{Ruby logger that writes directly to LogStash w/ cronolog support}
  spec.summary       = spec.description
  spec.homepage      = 'http://github.com/ryaan-anthony/rails-kibana-logger'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "logstash-logger", "~> 0.13.0"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
