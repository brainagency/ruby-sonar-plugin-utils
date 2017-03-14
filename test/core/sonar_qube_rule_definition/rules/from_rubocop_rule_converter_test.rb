require 'test_helper'

describe SonarQubeRuleDefinition::Rules::FromRubocopRuleConverter do
  subject { SonarQubeRuleDefinition::Rules::FromRubocopRuleConverter.new(rubocop_rule) }

  let(:rule_definition) { subject.call }

  describe 'profile rule' do
    let(:rubocop_rule) { Rubocop::Rule.new('Style/Abc', 'Abc', 'Style guide info') }

    it 'returns a valid object type' do
      assert_instance_of SonarQubeRuleDefinition::Rule, rule_definition
    end

    it 'has proper key' do
      assert_equal rule_definition.key, rubocop_rule.key
    end

    it 'has proper name' do
      assert_equal rule_definition.name, rubocop_rule.description
    end

    it 'has proper description' do
      assert_equal rule_definition.description, rubocop_rule.description
    end

    it 'has proper priority' do
      assert_equal rule_definition.priority, 'MINOR'
    end

    it 'has proper type' do
      assert_equal rule_definition.type, 'CODE_SMELL'
    end

    it 'has proper status' do
      assert_equal rule_definition.status, 'READY'
    end
  end
end

