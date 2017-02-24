require_relative '../parser'
require_relative '../../rubocop/parser'
require_relative '../../sonar_qube_rule_definition/rules/from_rubocop_rule_converter'
require_relative '../../sonar_qube_rule_definition/rules/to_xml'

module CLI
  module RuleDefinition
    class Main
      attr_reader :argv

      def initialize(argv)
        @argv = argv
      end

      def call
        cli_options = parse_argv
        rubocop_config_file = read_and_parse_rubocop_config_file(cli_options.in_file_path)
        profile_rules = convert_to_rule_definitions(rubocop_config_file)
        write_xml_file(profile_rules, cli_options.out_file_path)
      end

      private

      def parse_argv
        CLI::Parser.parse(argv)
      end

      def read_and_parse_rubocop_config_file(file_path)
        content = File.read(file_path)
        Rubocop::Parser.new(content).call
      end

      def convert_to_rule_definitions(rubocop_config_file)
        rubocop_config_file.rules.map do |rubocop_rule|
          SonarQubeRuleDefinition::Rules::FromRubocopRuleConverter.new(rubocop_rule).call
        end
      end

      def write_xml_file(rules, file_path)
        File.open(file_path, 'w') do |file|
          file.write("<rules>\n")
          rules.each do |rule|
            xml_rule = SonarQubeRuleDefinition::Rules::ToXml.new(rule).call
            file.write(xml_rule)
            file.write("\n")
          end
          file.write("</rules>")
        end
      end
    end
  end
end

