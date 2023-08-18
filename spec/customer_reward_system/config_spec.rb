# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CustomerRewardSystem::Config do
  subject { described_class.new }

  # Since it is important to have the correct order of the rules
  # it is required to test the order of the rules in the config
  describe 'rule order' do
    context 'with default rules only' do
      it { is_expected.to respond_to(:rules) }
      it { expect(subject.rules).to be_an(Array) }
      it { expect(subject.rules[0]).to be_an_instance_of(CustomerRewardSystem::Rules::BuiltIn::ForthOfMay) }
      it { expect(subject.rules[1]).to be_an_instance_of(CustomerRewardSystem::Rules::BuiltIn::HigherThanX) }
      it { expect(subject.rules[2]).to be_an_instance_of(CustomerRewardSystem::Rules::BuiltIn::LastThirtyDays) }
    end
  end

  context 'with a new rule' do
    subject { described_class.new(rules: [rule]) }

    let(:rule) { CustomerRewardSystem::Rules::BuiltIn::ForthOfMay.new }

    it 'goes to the end' do
      expect(subject.rules.last).to eq(rule)
    end
  end
end
