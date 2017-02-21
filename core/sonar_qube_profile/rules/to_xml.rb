require_relative '../rule'

module SonarQubeProfile
  module Rules
    class ToXml
      attr_reader :rule

      def initialize(rule)
        @rule = rule
      end

      def call
        content = [repository_tag, key_tag, priority_tag].join("\n")
        apply_template(content)
      end

      private

      def repository_tag
        "<repositoryKey>#{rule.repository_key}</repositoryKey>"
      end

      def key_tag
        "<key>#{rule.key}</key>"
      end
      def priority_tag
        "<priority>#{rule.priority}</priority>"
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
