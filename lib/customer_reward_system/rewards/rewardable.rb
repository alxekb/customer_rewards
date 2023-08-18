# frozen_string_literal: true

module CustomerRewardSystem
  # == module CustomerRewardSystem::Rewardable
  #
  # Here we define the helper methods for accessing rewards
  module Rewards
    # == module CustomerRewardSystem::Rewardable
    #
    # Here we define the helper methods for accessing rewards
    module Rewardable
      protected

      def null_reward
        @null_reward ||= CustomerRewardSystem::Rewards::NullReward.new
      end

      def next_purchase_free_reward
        @next_purchase_free_reward ||= CustomerRewardSystem::Rewards::NextPurchaseFree.new
      end

      def star_wars_reward
        @star_wars_reward ||= CustomerRewardSystem::Rewards::StarWarsThemedItemAddedToDelivery.new
      end

      def twenty_percent_off_next_order
        @twenty_percent_off_next_order ||= CustomerRewardSystem::Rewards::TwentyPercentOffNextOrder.new
      end

      def higher_than_x_reward(_amount)
        @higher_than_x_reward ||= CustomerRewardSystem::Rewards::HigherThanX.new
      end
    end
  end
end
