
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "open_api/version"

Gem::Specification.new do |spec|
  spec.name          = "open_api"
  spec.version       = OpenApi::VERSION
  spec.authors       = ["Kent Nagata", "Wantedly, Inc."]
  spec.email         = ["ngtknt@me.com", "dev@wantedly.com"]

  spec.summary       = "Provide PORO of OpenAPI specification"
  spec.description   = "It provides PORO of OpenAPI specification. It only support OpenAPI v3."
  spec.homepage      = "https://github.com/wantedly/open_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ['>= 5.0', '< 7.2']
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  # Pin to 1.17 due to https://github.com/codeclimate/test-reporter/issues/413
  spec.add_development_dependency "simplecov", "~> 0.17.0"
  spec.add_development_dependency "bump"
end
