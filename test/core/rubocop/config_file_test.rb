require 'test_helper'

describe Rubocop::ConfigFile do
  subject { Rubocop::ConfigFile.new }

  it 'has rules reader' do
    assert subject.respond_to?(:rules)
  end

  describe '#add_rule' do
    it 'adds rule into a collection' do
      rule = :rule
      subject.add_rule rule
      assert subject.rules.include?(rule)
    end
  end
end
