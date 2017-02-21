module SonarQubeProfile
  class Rule
    attr_reader :repository_key
    attr_reader :key
    attr_reader :priority

    def initialize(repository_key:, key:, priority:)
      @repository_key = repository_key
      @key = key
      @priority = priority
    end
  end
end
