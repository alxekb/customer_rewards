# frozen_string_literal: true

module CustomerRewardSystem
  # == class CustomerRewardSystem::Config
  #
  # Config is a container for reward rules
  #
  # It is responsible for loading reward rules and providing them to the reward scheme.
  class Config
    include CustomerRewardSystem::Rules::Ruleable

    attr_reader :rules

    def initialize(rules: [])
      @rules = built_in_rules.concat(rules)
    end
  end
end
