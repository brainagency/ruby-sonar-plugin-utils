#!/usr/bin/env ruby

require_relative 'core/cli/to_profile/main'

CLI::ToProfile::Main.new(ARGV).call
