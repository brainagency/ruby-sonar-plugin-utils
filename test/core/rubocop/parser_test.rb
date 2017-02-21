require 'test_helper'

describe Rubocop::Parser do
  subject { Rubocop::Parser.new(content) }

  let(:content) do
    <<-YAML
    Style/AccessModifierIndentation:
      Description: Check indentation of private/protected visibility modifiers.
      StyleGuide: '#indent-public-private-protected'
      Enabled: true
    YAML
  end

  describe 'result of parsing' do
    let(:result) { subject.call }

    it 'properly parses rubocop YAML config content' do
      assert result.is_a?(Rubocop::ConfigFile)
      assert result.rules.count == 1
    end

    describe 'parsed rule' do
      let(:rule) { result.rules.first }

      it 'has proper attribute values' do
        assert_equal rule.key, 'Style/AccessModifierIndentation'
        assert_equal rule.description, 'Check indentation of private/protected visibility modifiers.'
      end
    end
  end
end
