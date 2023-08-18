# frozen_string_literal: true

module CustomerRewardSystem
  module Rewards
    # == class CustomerRewardSystem::Rewards::NextPurchaseFree
    class NextPurchaseFree < CustomerRewardSystem::Rewards::BaseReward
      def name
        'Next purchase free'
      end
    end
  end
end
