require 'test_helper'

describe SonarQubeProfile::Rules::ToXml do
  subject { SonarQubeProfile::Rules::ToXml.new(rule) }

  let(:rule) do
    SonarQubeProfile::Rule.new(
      repository_key: 'rubocop',
      key: 'Style/Abc',
      priority: SonarQubeProfile::RulePriorities::MINOR
    )
  end

  let(:xml_rule) { subject.call }

  describe 'resulting xml' do
    it 'has all properties from rule inside content' do
      assert xml_rule.include?(rule.repository_key)
      assert xml_rule.include?(rule.key)
      assert xml_rule.include?(rule.priority)
    end
  end
end
