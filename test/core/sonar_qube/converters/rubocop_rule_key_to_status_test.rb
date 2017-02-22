require 'test_helper'

describe SonarQube::Converters::RubocopRuleKeyToStatus do
  subject { SonarQube::Converters::RubocopRuleKeyToStatus.new(rubocop_rule_key) }

  let(:status) { subject.call }

  describe 'WHEN rubocop rule key starts with Style' do
    let(:rubocop_rule_key) { 'Style/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with Metrics' do
    let(:rubocop_rule_key) { 'Metrics/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with Lint' do
    let(:rubocop_rule_key) { 'Lint/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with Bundler' do
    let(:rubocop_rule_key) { 'Bundler/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with Performance' do
    let(:rubocop_rule_key) { 'Performance/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with Rails' do
    let(:rubocop_rule_key) { 'Style/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with Security' do
    let(:rubocop_rule_key) { 'Security/Abc' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end

  describe 'WHEN rubocop rule key starts with some unexpected substring' do
    let(:rubocop_rule_key) { 'SomeIssue' }

    it 'sets status to Ready' do
      assert_equal status, SonarQube::RuleStatuses::READY
    end
  end
end
