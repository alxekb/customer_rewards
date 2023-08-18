# frozen_string_literal: true

module CustomerRewardSystem
  module Rewards
    # == class CustomerRewardSystem::Rewards::HigherThanXReward
    class HigherThanXReward < CustomerRewardSystem::Rewards::BaseReward
      attr_reader :amount

      def initialize(amount)
        @amount = amount
        super
      end

      def name
        "Higher than #{amount}"
      end
    end
  end
end
