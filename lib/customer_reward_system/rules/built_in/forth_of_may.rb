# frozen_string_literal: true

module CustomerRewardSystem
  module Rules
    module BuiltIn
      # == class CustomerRewardSystem::Rules::BuiltIn::ForthOfMay
      class ForthOfMay < CustomerRewardSystem::Rule
        alias evaluate reward_for

        def applies_to?(purchases)
          purchases.any? { |purchase| purchase['created_at'].eql?(forth_of_may) }
        end

        def reward_for(purchases)
          return next_purchase_free_reward if applies_to?(purchases)

          super
        end

        private

        def forth_of_may
          @forth_of_may ||= Time.utc(2023, 5, 4)
        end
      end
    end
  end
end
