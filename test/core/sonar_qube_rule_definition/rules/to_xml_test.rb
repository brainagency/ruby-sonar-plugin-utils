require 'test_helper'

describe SonarQubeRuleDefinition::Rules::ToXml do
  subject { SonarQubeRuleDefinition::Rules::ToXml.new(rule) }

  let(:rule) do
    SonarQubeRuleDefinition::Rule.new(
      key: 'Style/Abc',
      priority: SonarQube::RulePriorities::MINOR,
      name: 'Name rule',
      description: 'Rule description',
      type: SonarQube::RuleTypes::BUG,
      status: SonarQube::RuleStatuses::READY
    )
  end

  let(:xml_rule) { subject.call }

  describe 'resulting xml' do
    it 'has all properties from rule inside content' do
      assert xml_rule.include?(rule.key)
      assert xml_rule.include?(rule.priority)
      assert xml_rule.include?(rule.name)
      assert xml_rule.include?(rule.description)
      assert xml_rule.include?(rule.type)
      assert xml_rule.include?(rule.status)
    end
  end
end

