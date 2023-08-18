module CustomerRewardSystem
  module Rewards
    class HigherThanXReward < CustomerRewardSystem::Rewards::BaseReward
      def name
        'Higher than X'
      end
    end
  end
end
