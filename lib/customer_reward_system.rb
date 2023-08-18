# frozen_string_literal: true

require 'json'
require 'active_support/all'

require('./lib/customer_reward_system/rules/ruleable')
Dir[File.join(__dir__, 'customer_reward_system', '**', '*.rb')].each { |file| require_relative file }
