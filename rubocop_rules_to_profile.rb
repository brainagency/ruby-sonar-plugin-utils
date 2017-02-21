#!/usr/bin/env ruby

require 'optparse'
require 'yaml'

class Options < Struct.new(:in_file, :out_file)
end

module CLI
  class Parser
    def self.parse(options) 
      args = Options.new(nil, nil)
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: rubocop_rules_to_profile.rb [options]"

        opts.on("-iIN_FILE_PATH", String, "A path to a source file with rubocop rules") do |in_file|
          args.in_file = in_file
        end

        opts.on("-oOUT_FILE_PATH", String, "A path to an output file with rules for SQ profile file") do |out_file|
          args.out_file = out_file
        end

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end

      opt_parser.parse!(options)
      return args
    end
  end
end

require 'pry-nav'
binding.pry

cli_options = begin
                CLI::Parser.parse ARGV
              rescue OptionParser::InvalidArgument => e
                puts "Invalid CLI options are passed! Original exception message: #{e.message}"
                puts "Please, run `./rubocop_rules_to_profile.rb --help` first to see all available options."
                exit
              end

rubocop_rules_file = YAML.load_file(cli_options.in_file)


