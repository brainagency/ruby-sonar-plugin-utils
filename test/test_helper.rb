require 'minitest/autorun'
require 'minitest/matchers'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

Dir[File.dirname(__FILE__) + '/../core/**/*.rb'].each {|file| require file }
