require 'test_helper'

describe SonarQube::Converters::RubocopRuleKeyToPriority do
  subject { SonarQube::Converters::RubocopRuleKeyToPriority.new(rubocop_rule_key) }

  let(:priority) { subject.call }

  describe 'WHEN rubocop rule key starts with Style' do
    let(:rubocop_rule_key) { 'Style/Abc' }

    it 'sets priority to Minor' do
      assert_equal priority, SonarQube::RulePriorities::MINOR
    end
  end

  describe 'WHEN rubocop rule key starts with Metrics' do
    let(:rubocop_rule_key) { 'Metrics/Abc' }

    it 'sets priority to Info' do
      assert_equal priority, SonarQube::RulePriorities::INFO
    end
  end

  describe 'WHEN rubocop rule key starts with Lint' do
    let(:rubocop_rule_key) { 'Lint/Abc' }

    it 'sets priority to Minor' do
      assert_equal priority, SonarQube::RulePriorities::MINOR
    end
  end

  describe 'WHEN rubocop rule key starts with Bundler' do
    let(:rubocop_rule_key) { 'Bundler/Abc' }

    it 'sets priority to Info' do
      assert_equal priority, SonarQube::RulePriorities::INFO
    end
  end

  describe 'WHEN rubocop rule key starts with Performance' do
    let(:rubocop_rule_key) { 'Performance/Abc' }

    it 'sets priority to Minor' do
      assert_equal priority, SonarQube::RulePriorities::MINOR
    end
  end

  describe 'WHEN rubocop rule key starts with Rails' do
    let(:rubocop_rule_key) { 'Style/Abc' }

    it 'sets priority to Minor' do
      assert_equal priority, SonarQube::RulePriorities::MINOR
    end
  end

  describe 'WHEN rubocop rule key starts with Security' do
    let(:rubocop_rule_key) { 'Security/Abc' }

    it 'sets priority to Critical' do
      assert_equal priority, SonarQube::RulePriorities::CRITICAL
    end
  end

  describe 'WHEN rubocop rule key starts with some unexpected substring' do
    let(:rubocop_rule_key) { 'SomeIssue' }

    it 'sets priority to Minor' do
      assert_equal priority, SonarQube::RulePriorities::MINOR
    end
  end
end
