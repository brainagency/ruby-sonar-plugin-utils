require 'test_helper'

describe CLI::Parser do
  subject { CLI::Parser.parse(argv) }

  describe 'WHEN ARGV are valid' do
    let(:argv) do
      ['-i', 'input_file_path', '-o', 'output_file_path']
    end

    it 'parses properly without exception' do
      assert_instance_of CLI::Options, subject
      assert_equal subject.in_file_path, 'input_file_path'
      assert_equal subject.out_file_path, 'output_file_path'
    end
  end

  describe 'WHEN some options was not passed' do
    let(:argv) do
      ['-i', 'input_file_path']
    end

    it 'raises OptionParser::MissingArgument' do
      assert_raises OptionParser::MissingArgument do
        subject
      end
    end
  end

  describe 'WHEN ARGV are not valid' do
    let(:argv) do
      ['-i', 'input_file_path', '-t']
    end

    it 'raises OptionParser::InvalidOption' do
      assert_raises OptionParser::InvalidOption do
        subject
      end
    end
  end
end
