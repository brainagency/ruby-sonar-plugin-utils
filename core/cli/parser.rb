require 'optparse'

module CLI
  class Parser
    def self.parse(options) 
      args = Options.new(nil, nil)
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: rubocop_rules_to_profile.rb [options]"

        opts.on("-iIN_FILE_PATH", String, "A path to a source file with rubocop rules") do |in_file|
          args.in_file_path = in_file
        end

        opts.on("-oOUT_FILE_PATH", String, "A path to an output file with rules for SQ profile file") do |out_file|
          args.out_file_path = out_file
        end

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end

      opt_parser.parse!(options)
      args.validate!
      return args
    end
  end

  class Options < Struct.new(:in_file_path, :out_file_path)
    def validate!
      return if in_file_path && out_file_path
      raise OptionParser::MissingArgument, 'All options are required!'
    end
  end
end
