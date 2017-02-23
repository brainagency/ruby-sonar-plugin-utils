require_relative '../rule'

module SonarQubeRuleDefinition
  module Rules
    class ToXml
      attr_reader :rule

      def initialize(rule)
        @rule = rule
      end

      def call
        content = tags_collection.join("\n")
        apply_template(content)
      end

      private

      def tags_collection
        [key_tag, priority_tag, name_tag, description_tag, type_tag, status_tag]
      end

      def key_tag
        "<key>#{rule.key}</key>"
      end

      def priority_tag
        "<priority>#{rule.priority}</priority>"
      end

      def name_tag
        "<name>#{rule.name}</name>"
      end

      def description_tag
        "<description>#{rule.description}</description>"
      end

      def type_tag
        "<type>#{rule.type}</type>"
      end

      def status_tag
        "<status>#{rule.status}</status>"
      end

      def apply_template(content)
        <<-XML
          <rule>
            #{content}   
          </rule>
        XML
      end
    end
  end
end

