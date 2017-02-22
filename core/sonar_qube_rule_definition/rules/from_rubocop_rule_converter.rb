require_relative '../rule'
require_relative '../../sonar_qube/converters/rubocop_rule_key_to_priority'
require_relative '../../sonar_qube/converters/rubocop_rule_key_to_status'
require_relative '../../sonar_qube/converters/rubocop_rule_key_to_type'

module SonarQubeRuleDefinition
  module Rules
    class FromRubocopRuleConverter
      attr_reader :rubocop_rule

      def initialize(rubocop_rule)
        @rubocop_rule = rubocop_rule
      end

      def call
        SonarQubeRuleDefinition::Rule.new(
          key: fetch_rubocop_rule_key,
          name: rubocop_rule.description,
          description: rubocop_rule.description,
          priority: resolve_priority,
          type: resolve_type,
          status: resolve_status
        )
      end

      private

      def fetch_rubocop_rule_key
        rubocop_rule.key
      end

      def resolve_priority
        SonarQube::Converters::RubocopRuleKeyToPriority.new(fetch_rubocop_rule_key).call
      end

      def resolve_type
        SonarQube::Converters::RubocopRuleKeyToType.new(fetch_rubocop_rule_key).call
      end

      def resolve_status
        SonarQube::Converters::RubocopRuleKeyToStatus.new(fetch_rubocop_rule_key).call
      end
    end
  end
end
