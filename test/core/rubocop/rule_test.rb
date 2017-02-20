require 'test_helper'

describe Rubocop::Rule do
  before do
    @rule = Rubocop::Rule.new
  end

  it 'has key property' do
    assert @rule.respond_to? :key
    assert @rule.respond_to? :key=
  end

  it 'has description property' do
    assert @rule.respond_to? :description
    assert @rule.respond_to? :description=
  end

  it 'has style_guide property' do
    assert @rule.respond_to? :style_guide
    assert @rule.respond_to? :style_guide=
  end
end
