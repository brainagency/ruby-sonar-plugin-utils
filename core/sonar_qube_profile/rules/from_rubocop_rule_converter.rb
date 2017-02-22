require_relative '../rule'
require_relative '../../sonar_qube/rule_priorities'

module SonarQubeProfile
  module Rules
    class FromRubocopRuleConverter
      DEFAULT_REPO_KEY = 'rubocop'

      KEY_PREFIX_MAPPING_TO_PRIORITY = {
        /^Style/       => SonarQube::RulePriorities::MINOR,
        /^Metrics/     => SonarQube::RulePriorities::INFO,
        /^Lint/        => SonarQube::RulePriorities::MINOR,
        /^Bundler/     => SonarQube::RulePriorities::INFO,
        /^Performance/ => SonarQube::RulePriorities::MINOR,
        /^Rails/       => SonarQube::RulePriorities::MINOR,
        /^Security/    => SonarQube::RulePriorities::CRITICAL
      }

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
        key = fetch_rubocop_rule_key
        KEY_PREFIX_MAPPING_TO_PRIORITY.each do |key_regex, priority|
          return priority if key_regex.match(key)
        end
        SonarQube::RulePriorities::MINOR
      end
    end
  end
end
