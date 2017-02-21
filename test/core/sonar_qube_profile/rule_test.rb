require 'test_helper'

describe SonarQubeProfile::Rule do
  subject { SonarQubeProfile::Rule.new(opts) }

  let(:opts) { {repository_key: 'repo', key: 'rule1', priority: SonarQubeProfile::RulePriorities::MINOR} }

  it 'has proper list of readers' do
    assert subject.respond_to? :repository_key
    assert subject.respond_to? :key
    assert subject.respond_to? :priority
  end
end
