# frozen_string_literal: true

module CustomerRewardSystem
  module Rewards
    # =class CustomerRewardSystem::RewardPrograms::Base
    #
    # Reward program is a container for a specific reward rule
    #
    # It is responsible for checking if purchase is eligible for reward
    # and the determined rewards (if any)
    class BaseReward
      def name
        raise NotImplementedError
      end
    end
  end
end
