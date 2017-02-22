require_relative '../rule_statuses'

module SonarQube
  module Converters
    class RubocopRuleKeyToStatus
      attr_reader :rule_key

      def initialize(rule_key)
        @rule_key =  rule_key
      end

      def call
        # Maybe there will be some more complex logic...
        SonarQube::RuleStatuses::READY
      end
    end
  end
end
