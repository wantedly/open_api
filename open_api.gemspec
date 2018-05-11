
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "open_api/version"

Gem::Specification.new do |spec|
  spec.name          = "open_api"
  spec.version       = OpenApi::VERSION
  spec.authors       = ["Kent Nagata"]
  spec.email         = ["ngtknt@me.com"]

  spec.summary       = "Provide PORO of OpenAPI specification"
  spec.description   = "It provides PORO of OpenAPI specification. It only support OpenAPI v3."
  spec.homepage      = "https://github.com/ngtk/open_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 5.0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "bump"
end
