require 'test_helper'

describe SonarQube::Converters::RubocopRuleKeyToType do
  subject { SonarQube::Converters::RubocopRuleKeyToType.new(rubocop_rule_key) }

  let(:type) { subject.call }

  describe 'WHEN rubocop rule key starts with Style' do
    let(:rubocop_rule_key) { 'Style/Abc' }

    it 'sets type to CodeSmell' do
      assert_equal type, SonarQube::RuleTypes::CODE_SMELL
    end
  end

  describe 'WHEN rubocop rule key starts with Metrics' do
    let(:rubocop_rule_key) { 'Metrics/Abc' }

    it 'sets type to CodeSmell' do
      assert_equal type, SonarQube::RuleTypes::CODE_SMELL
    end
  end

  describe 'WHEN rubocop rule key starts with Lint' do
    let(:rubocop_rule_key) { 'Lint/Abc' }

    it 'sets type to CodeSmell' do
      assert_equal type, SonarQube::RuleTypes::CODE_SMELL
    end
  end

  describe 'WHEN rubocop rule key starts with Bundler' do
    let(:rubocop_rule_key) { 'Bundler/Abc' }

    it 'sets type to CodeSmell' do
      assert_equal type, SonarQube::RuleTypes::CODE_SMELL
    end
  end

  describe 'WHEN rubocop rule key starts with Performance' do
    let(:rubocop_rule_key) { 'Performance/Abc' }

    it 'sets type to Bug' do
      assert_equal type, SonarQube::RuleTypes::BUG
    end
  end

  describe 'WHEN rubocop rule key starts with Rails' do
    let(:rubocop_rule_key) { 'Style/Abc' }

    it 'sets type to CodeSmell' do
      assert_equal type, SonarQube::RuleTypes::CODE_SMELL
    end
  end

  describe 'WHEN rubocop rule key starts with Security' do
    let(:rubocop_rule_key) { 'Security/Abc' }

    it 'sets type to Vulnerability' do
      assert_equal type, SonarQube::RuleTypes::VULNERABILITY
    end
  end

  describe 'WHEN rubocop rule key starts with some unexpected substring' do
    let(:rubocop_rule_key) { 'SomeIssue' }

    it 'sets type to CodeSmell' do
      assert_equal type, SonarQube::RuleTypes::CODE_SMELL
    end
  end
end
