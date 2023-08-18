# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CustomerRewardSystem::Schema do
  subject { described_class.new(config:) }

  let(:config) { CustomerRewardSystem::Config.new }

  let(:purchases) do
    file = File.read('spec/fixtures/purchases.json')
    JSON.parse(file)
  end

  describe 'configuration' do
    context 'with default rules only' do
      it 'imports default rules from the config' do
        expect(subject.rules.count).to eq(3)
        expect(subject.rules[0]).to be_an_instance_of(CustomerRewardSystem::Rules::BuiltIn::ForthOfMay)
      end
    end

    context 'with a new rule' do
      let(:rule) { CustomerRewardSystem::Rules::BuiltIn::ForthOfMay.new }

      before do
        subject.add_rule(rule)
      end

      it 'goes to the end of rules' do
        expect(subject.rules.last).to eq(rule)
      end
    end

    describe '#result_for' do
      let(:rewards) { ['No reward', 'Next purchase free', '20% off next order'] }

      it 'returns a list of rewards' do
        result = subject.result_for(purchases:)

        expect(result.map(&:name)).to eq(rewards)
      end
    end

    describe '#evaluate' do
      let(:reward) { '20% off next order' }

      it 'returns the last reward' do
        result = subject.evaluate(purchases:)

        expect(result).to eq(reward)
      end

      context 'with no rewards' do
        context 'with no purchases' do
          let(:purchases) { [] }

          it 'returns no reward' do
            result = subject.evaluate(purchases:)

            expect(result).to eq('No reward')
          end
        end

        context 'with no purchases' do
          let(:purchases) do
            file = File.read('spec/fixtures/purchases_without_rewards.json')
            JSON.parse(file)
          end

          let(:no_reward) { 'No reward' }

          it 'returns the last reward' do
            result = subject.evaluate(purchases:)

            expect(result).to eq(no_reward)
          end
        end
      end
    end
  end
end
