# frozen_string_literal: true

module CustomerRewardSystem
  module Rewards
    # == class CustomerRewardSystem::Rewards::NullReward
    #
    # NullReward is a class that represents a null object for Reward
    class NullReward < CustomerRewardSystem::Rewards::BaseReward
      def name
        'No reward'
      end
    end
  end
end
