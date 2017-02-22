require_relative '../rule_types'

module SonarQube
  module Converters
    class RubocopRuleKeyToType
      MAPPING = {
        /^Style/       => SonarQube::RuleTypes::CODE_SMELL,
        /^Metrics/     => SonarQube::RuleTypes::CODE_SMELL,
        /^Lint/        => SonarQube::RuleTypes::CODE_SMELL,
        /^Bundler/     => SonarQube::RuleTypes::CODE_SMELL,
        /^Performance/ => SonarQube::RuleTypes::BUG,
        /^Rails/       => SonarQube::RuleTypes::CODE_SMELL,
        /^Security/    => SonarQube::RuleTypes::VULNERABILITY
      }

      attr_reader :rule_key

      def initialize(rule_key)
        @rule_key =  rule_key
      end

      def call
        MAPPING.each do |key_regex, type|
          return type if key_regex.match(rule_key)
        end
        SonarQube::RuleTypes::CODE_SMELL
      end
    end
  end
end
