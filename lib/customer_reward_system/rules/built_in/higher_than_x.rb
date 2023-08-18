module CustomerRewardSystem
  module Rules
    module BuiltIn
      # class CustomerRewardSystem::RewardProgram::HigherThanX
      class HigherThanX < CustomerRewardSystem::Rule
        attr_reader :arg

        def initialize(*args)
          @arg = args[0][:amount]
          super
        end

        def name
          raise NotImplementedError
        end

        def applies_to?(purchases)
          purchases.any? do |purchase|
            purchase['purchase_amount_cents'] > @arg
          end
        end

        def reward_for(purchases)
          return next_purchase_free_reward if applies_to?(purchases)

          super
        end
      end
    end
  end
end
