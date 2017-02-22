require_relative '../rule_priorities'

module SonarQube
  module Converters
    class RubocopRuleKeyToPriority
      MAPPING = {
        /^Style/       => SonarQube::RulePriorities::MINOR,
        /^Metrics/     => SonarQube::RulePriorities::INFO,
        /^Lint/        => SonarQube::RulePriorities::MINOR,
        /^Bundler/     => SonarQube::RulePriorities::INFO,
        /^Performance/ => SonarQube::RulePriorities::MINOR,
        /^Rails/       => SonarQube::RulePriorities::MINOR,
        /^Security/    => SonarQube::RulePriorities::CRITICAL
      }

      attr_reader :rule_key

      def initialize(rule_key)
        @rule_key =  rule_key
      end

      def call
        MAPPING.each do |key_regex, priority|
          return priority if key_regex.match(rule_key)
        end
        SonarQube::RulePriorities::MINOR
      end
    end
  end
end
