# frozen_string_literal: true

module CustomerRewardSystem
  module Rewards
    class NullReward < CustomerRewardSystem::Rewards::BaseReward
      def name
        'No reward'
      end
    end
  end
end
