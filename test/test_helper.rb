require 'minitest/autorun'
require 'minitest/matchers'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use!([
  Minitest::Reporters::DefaultReporter.new(reporter_options),
  Minitest::Reporters::SpecReporter.new
])

Dir[File.dirname(__FILE__) + '/../core/**/*.rb'].each {|file| require file }

class TestHelper
  def self.rubocop_example_file_path
    File.expand_path(File.dirname(__FILE__) + '/resources/rubocop_small_example.yaml')
  end

  def self.profile_output_file_path
    File.expand_path(File.dirname(__FILE__) + '/../tmp/sonar_qube_profile_test_output.xml')
  end

  def self.rule_definition_output_file_path
    File.expand_path(File.dirname(__FILE__) + '/../tmp/sonar_qube_rule_definition_test_output.xml')
  end
end
