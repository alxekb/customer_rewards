# frozen_string_literal: true

module CustomerRewardSystem
  module Rewards
    # == class CustomerRewardSystem::Rewards::TwentyPercentOffNextOrder
    class TwentyPercentOffNextOrder < CustomerRewardSystem::Rewards::BaseReward
      def name
        '20% off next order'
      end
    end
  end
end
