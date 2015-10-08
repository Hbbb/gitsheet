# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gitsheet/version'

Gem::Specification.new do |spec|
  spec.name          = "gitsheet"
  spec.version       = Gitsheet::VERSION
  spec.authors       = ["Hbbb"]
  spec.email         = ["h.borges10592@gmail.com"]
 
  spec.summary       = %q{Github API command line tool.}
  spec.description   = %q{Gitsheet is a small command line utility to quickly gather user and repository data from Github's API.}
  spec.homepage      = "https://github.com/Hbbb/gitx"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["gitsheet"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "pry-byebug"
end
