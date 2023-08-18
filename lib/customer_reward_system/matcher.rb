module CustomerRewardSystem
  # class CustomerRewardSystem::Matcher
  #
  # This class is used to match customer purchases to a certain rewards
  # program. It gets initialized with a customer and a purchases array, and then
  # it will return the appropriate rewards program for that customer.
  #
  # @example
  #  customer = CustomerRewardSystem::Customer.new
  #  purchases = [CustomerRewardSystem::Purchase.new]
  #
  #  matcher = CustomerRewardSystem::Matcher.new(customer, purchases)
  #
  #  matcher.rewards_program
  #  # => CustomerRewardSystem::RewardsProgram::NextPurchaseFree
  class Matcher
    def initialize(customer:, purchases:, reward_programs: nil)
      @customer = customer
      @purchases = purchases
      @reward_programs = []
    end

    def reward_programs
      @reward_programs ||= RewardProgram.all
    end

  end
end
