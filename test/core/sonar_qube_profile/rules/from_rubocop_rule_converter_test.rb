require 'test_helper'

describe SonarQubeProfile::Rules::FromRubocopRuleConverter do
  subject { SonarQubeProfile::Rules::FromRubocopRuleConverter.new(rubocop_rule) }

  let(:profile_rule) { subject.call }

  describe 'basic functionality' do
    let(:rubocop_rule) { Rubocop::Rule.new('Style/Abc', 'Abc', 'Style guide info') }

    it 'returns a valid object type' do
      assert_instance_of SonarQubeProfile::Rule, profile_rule
    end
  end

  describe 'priority setupping' do
    let(:rubocop_rule) { Rubocop::Rule.new(rubocop_rule_key, 'Abc', 'Style guide info') }

    describe 'WHEN rubocop rule key starts with Style' do
      let(:rubocop_rule_key) { 'Style/Abc' }

      it 'sets priority to Minor' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::MINOR
      end
    end

    describe 'WHEN rubocop rule key starts with Metrics' do
      let(:rubocop_rule_key) { 'Metrics/Abc' }

      it 'sets priority to Info' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::INFO
      end
    end

    describe 'WHEN rubocop rule key starts with Lint' do
      let(:rubocop_rule_key) { 'Lint/Abc' }

      it 'sets priority to Minor' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::MINOR
      end
    end

    describe 'WHEN rubocop rule key starts with Bundler' do
      let(:rubocop_rule_key) { 'Bundler/Abc' }

      it 'sets priority to Info' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::INFO
      end
    end

    describe 'WHEN rubocop rule key starts with Performance' do
      let(:rubocop_rule_key) { 'Performance/Abc' }

      it 'sets priority to Minor' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::MINOR
      end
    end

    describe 'WHEN rubocop rule key starts with Rails' do
      let(:rubocop_rule_key) { 'Style/Abc' }

      it 'sets priority to Minor' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::MINOR
      end
    end
    
    describe 'WHEN rubocop rule key starts with Security' do
      let(:rubocop_rule_key) { 'Security/Abc' }

      it 'sets priority to Critical' do
        assert_equal profile_rule.priority, SonarQube::RulePriorities::CRITICAL
      end
    end
  end
end
