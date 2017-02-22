require 'test_helper'

describe SonarQubeRuleDefinition::Rule do
  subject { SonarQubeRuleDefinition::Rule.new(opts) }

  let(:opts) do
    {key: 'ruleKey', name: 'Rule 1'}
  end

  it 'has a proper list of readers' do
    assert subject.respond_to? :key
    assert subject.respond_to? :priority
    assert subject.respond_to? :name
    assert subject.respond_to? :description
    assert subject.respond_to? :type
    assert subject.respond_to? :status
  end
end
