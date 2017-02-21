require 'yaml'
require_relative 'config_file'
require_relative 'rule'

module Rubocop
  class Parser
    DESC_KEY = 'Description'
    STYLE_GUIDE_KEY = 'StyleGuide'

    attr_reader :content

    def initialize(content)
      @content = content
    end

    def call
      content_yaml = parse_content
      rules = parse_rules(content_yaml)
      build_config_file(rules)
    end

    private

    def parse_content
      YAML.load(content)
    end

    def parse_rules(content_yaml)
      content_yaml.map do |key, options|
        description = options[DESC_KEY]
        style_guide = options[STYLE_GUIDE_KEY]
        Rule.new(key, description, style_guide)
      end
    end

    def build_config_file(rules)
      ConfigFile.new.tap do |rubocop_config_file|
        rules.each { |rule| rubocop_config_file.add_rule(rule) }
      end
    end
  end
end
