require 'test_helper'

describe CLI::RuleDefinition::Main do
  subject { CLI::RuleDefinition::Main.new(argv) }

  let(:argv) do
    [
      '-i',
      input_file_path,
      '-o',
      output_file_path
    ]
  end

  let(:input_file_path) { TestHelper.rubocop_example_file_path }
  let(:output_file_path) { TestHelper.rule_definition_output_file_path }

  before do
    begin
      File.delete(output_file_path)
    rescue Errno::ENOENT
    end
  end

  it 'creates an output file' do
    subject.call
    assert File.exists?(output_file_path)
  end
end

