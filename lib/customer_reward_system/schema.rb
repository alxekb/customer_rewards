# frozen_string_literal: true

module CustomerRewardSystem
  # == class CustomerRewardSystem:Schema
  #
  # Schema has a list of rules that could be used to process rewards to customer purchases.
  #
  # Schema has default set of rules and can be extended with custom rules.
  # Custom rules can be dynamically added to the schema by calling #add_rule method.
  #
  # On initialization, schema will load default set of rules and will add custom rules if provided in configuration.
  class Schema
    attr_reader :rules

    # @param config [CustomerRewardSystem::Config]
    def initialize(config:)
      configure(config)
    end

    # @param config [CustomerRewardSystem::Config]
    def configure(config)
      unless config.is_a?(CustomerRewardSystem::Config)
        raise ArgumentError,
              'config must be an instance of CustomerRewardSystem::Config'
      end

      @rules = config.rules
    end

    # Get the list of rewards for the given purchases
    # @param purchase [Array<CustomerRewardSystem::Purchase>]
    # @return [Array<CustomerRewardSystem::Reward>]
    def result_for(purchases:)
      rules.map { |rule| rule.reward_for(purchases) }
    end

    # Evaluates the reward for the given purchases
    # @param purchases [Array<CustomerRewardSystem::Purchase>]
    # @return String
    def evaluate(purchases:)
      rewards = all_rewards(purchases)

      select_reward(rewards).name
    end

    # Appends a new rule to the end of the rules list
    # @param rule [CustomerRewardSystem::Rules::Base]
    def add_rule(rule)
      unless rule.class.ancestors.include?(CustomerRewardSystem::Rule) # rubocop:disable Style/IfUnlessModifier
        raise ArgumentError, 'not a rule'
      end

      @rules.append(rule)
    end

    private

    def select_reward(rewards)
      rewards.reject { |reward| reward.is_a?(CustomerRewardSystem::Rewards::NullReward) }.last ||
        CustomerRewardSystem::Rewards::NullReward.new
    end

    def all_rewards(purchases)
      @all_rewards ||= result_for(purchases:)
    end
  end
end
