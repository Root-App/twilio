$LOAD_PATH << File.expand_path("../../lib", __FILE__)
require "twilio"

module SpecHelper
  TESTING_SID = "testing_sid".freeze
  TESTING_AUTH_TOKEN = "testing_auth_token".freeze
  TESTING_FROM_NUMBER = "testing_from_number".freeze

  def self.real_config
    {
      :account_sid => "real_sid",
      :communicator_strategy => Twilio::Gateway::Strategy::REAL,
      :auth_token => "real_auth_token",
      :from_number => "real_number"
    }.freeze
  end

  def self.fake_config
    {
      :account_sid => "fake_sid",
      :communicator_strategy => Twilio::Gateway::Strategy::FAKE,
      :auth_token => "fake_auth_token",
      :from_number => "fake_number"
    }.freeze
  end
end

