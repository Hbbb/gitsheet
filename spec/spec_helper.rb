$LOAD_PATH.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'pry'
require 'vcr'
require 'pry-byebug'
require 'gitx'
require 'formatter'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
end
