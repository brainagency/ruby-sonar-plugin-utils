#!/usr/bin/env ruby

require_relative 'core/cli/rule_definition/main'

CLI::RuleDefinition::Main.new(ARGV).call

