# frozen_string_literal: true

module CustomerRewardSystem
  module Rules
    module BuiltIn
      # == class CustomerRewardSystem::Rules::BuiltIn::LastThirtyDays
      class LastThirtyDays < CustomerRewardSystem::Rule
        def name
          'Last Thirty Days'
        end

        def applies_to?(purchases)
          purchases.each_with_object([]) do |p, obj|
            obj << p if Time.new(p['created_at']) > 13.years.ago
            return true if obj.size > 2
          end

          false
        end

        def reward_for(purchases)
          return twenty_percent_off_next_order if applies_to?(purchases)

          super
        end
      end
    end
  end
end
