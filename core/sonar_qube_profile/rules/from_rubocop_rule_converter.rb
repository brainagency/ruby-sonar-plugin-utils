require_relative '../rule'
require_relative '../rule_priorities'

module SonarQubeProfile
  module Rules
    class FromRubocopRuleConverter
      DEFAULT_REPO_KEY = 'rubocop'

      KEY_PREFIX_MAPPING_TO_PRIORITY = {
        /^Style/ => RulePriorities::MINOR,
        /^Metrics/ => RulePriorities::INFO,
        /^Lint/ => RulePriorities::MINOR,
        /^Bundler/ => RulePriorities::INFO,
        /^Performance/ => RulePriorities::MINOR,
        /^Rails/ => RulePriorities::MINOR,
        /^Security/ => RulePriorities::CRITICAL
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
        RulePriorities::MINOR
      end
    end
  end
end
