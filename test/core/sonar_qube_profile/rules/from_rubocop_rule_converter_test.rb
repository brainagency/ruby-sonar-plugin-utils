require 'test_helper'

describe SonarQubeProfile::Rules::FromRubocopRuleConverter do
  subject { SonarQubeProfile::Rules::FromRubocopRuleConverter.new(rubocop_rule) }

  let(:profile_rule) { subject.call }

  describe 'profile rule' do
    let(:rubocop_rule) { Rubocop::Rule.new('Style/Abc', 'Abc', 'Style guide info') }

    it 'returns a valid object type' do
      assert_instance_of SonarQubeProfile::Rule, profile_rule
    end

    it 'has proper repository_key' do
      assert_equal profile_rule.repository_key, 'rubocop'
    end

    it 'has proper key' do
      assert_equal profile_rule.key, rubocop_rule.key
    end

    it 'has proper priority' do
      assert_equal profile_rule.priority, 'MINOR'
    end
  end
end
