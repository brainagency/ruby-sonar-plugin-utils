require_relative '../rule'
require_relative '../../sonar_qube/rule_priorities'
require_relative '../../sonar_qube/converters/rubocop_rule_key_to_priority'

module SonarQubeProfile
  module Rules
    class FromRubocopRuleConverter
      DEFAULT_REPO_KEY = 'rubocop'

      attr_reader :rubocop_rule

      def initialize(rubocop_rule)
        @rubocop_rule = rubocop_rule
      end

      def call
        SonarQubeProfile::Rule.new(
          repository_key: DEFAULT_REPO_KEY,
          key: fetch_rubocop_rule_key,
          priority: decide_about_priority_based_on_key
        )
      end

      private

      def fetch_rubocop_rule_key
        rubocop_rule.key
      end

      def decide_about_priority_based_on_key
        SonarQube::Converters::RubocopRuleKeyToPriority.new(fetch_rubocop_rule_key).call
      end
    end
  end
end
