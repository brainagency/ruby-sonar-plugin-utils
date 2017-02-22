module SonarQubeRuleDefinition
  class Rule
    attr_reader :key
    attr_reader :priority
    attr_reader :name
    attr_reader :description
    attr_reader :type
    attr_reader :status

    def initialize(params = {})
      params.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end
  end
end
