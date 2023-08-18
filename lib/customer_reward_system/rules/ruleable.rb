# frozen_string_literal: true

module CustomerRewardSystem
  module Rules
    # == module CustomerRewardSystem::Rules::Ruleable
    #
    # Ruleable is a mixin for classes that need to load reward rules.
    module Ruleable
      private

      def built_in_rules
        @built_in_rules ||= [
          forth_of_may_rule,
          higher_than_x_rule(100),
          last_thirty_days_rule
        ]
      end

      def forth_of_may_rule
        @forth_of_may_rule ||= CustomerRewardSystem::Rules::BuiltIn::ForthOfMay.new
      end

      def higher_than_x_rule(amount)
        @higher_than_x_rule ||= CustomerRewardSystem::Rules::BuiltIn::HigherThanX.new(amount:)
      end

      def last_thirty_days_rule
        @last_thirty_days_rule ||= CustomerRewardSystem::Rules::BuiltIn::LastThirtyDays.new
      end
    end
  end
end
