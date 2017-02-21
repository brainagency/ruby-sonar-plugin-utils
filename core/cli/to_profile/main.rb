require_relative 'parser'
require_relative '../../rubocop/parser'
require_relative '../../sonar_qube_profile/rules/from_rubocop_rule_converter'

module CLI
  module ToProfile
    class Main
      attr_reader :argv

      def initialize(argv)
        @argv = argv
      end

      def call
        cli_options = parse_argv
        rubocop_config_file = read_and_parse_rubocop_config_file(cli_options.in_file_path)
        profile_rules = convert_to_profile_rules(rubocop_config_file)
      end

      private

      def parse_argv
        CLI::ToProfile::Parser.parse(argv)
      end

      def read_and_parse_rubocop_config_file(file_path)
        content = File.read(file_path)
        Rubocop::Parser.new(content).call
      end

      def convert_to_profile_rules(rubocop_config_file)
        rubocop_config_file.rules.map do |rubocop_rule|
          SonarQubeProfile::Rules::FromRubocopRuleConverter.new(rubocop_rule).call
        end
      end
    end
  end
end
