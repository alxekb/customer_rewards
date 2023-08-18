# frozen_string_literal: true

module CustomerRewardSystem
  # class CustomerRewardSystem::Rule
  class Rule
    include CustomerRewardSystem::Rewards::Rewardable

    def initialize(*args)
    end

    def applies_to?(purchases)
      raise NotImplementedError
    end

    def reward_for(_purchases)
      null_reward
    end
  end
end
