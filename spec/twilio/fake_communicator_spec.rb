require "spec_helper"

RSpec.describe Twilio::FakeCommunicator do
  let(:communicator) do
    described_class.new(
      SpecHelper::TESTING_SID,
      SpecHelper::TESTING_AUTH_TOKEN,
      SpecHelper::TESTING_FROM_NUMBER
    )
  end

  context "valid inputs" do
    it "should return successfully" do
      resp = communicator.send_sms_message(
        :to_number => "+11234567890",
        :message => "valid message"
      )

      expect(resp.success?).to eq(true)
    end
  end

  context "invalid token" do
    let(:communicator) do
      described_class.new(
        Twilio::FakeCommunicator::HTTP_ERROR_TOKEN,
        SpecHelper::TESTING_AUTH_TOKEN,
        SpecHelper::TESTING_FROM_NUMBER
      )
    end
    it "should return as failed" do
      resp = communicator.send_sms_message(
        :to_number => "+11234567890",
        :message => "valid message"
      )

      expect(resp.success?).to eq(false)
    end
  end

  context "invalid from number" do
    let(:communicator) do
      described_class.new(
        SpecHelper::TESTING_SID,
        SpecHelper::TESTING_AUTH_TOKEN,
        Twilio::FakeCommunicator::HTTP_ERROR_USER_ATTRIBUTES[:number]
      )
    end

    it "should return as failed" do
      resp = communicator.send_sms_message(
        :to_number => "+11234567890",
        :message => "valid message"
      )

      expect(resp.success?).to eq(false)
    end
  end

  context "invalid to number" do
    it "should return as failed" do
      resp = communicator.send_sms_message(
        :to_number => Twilio::FakeCommunicator::HTTP_ERROR_USER_ATTRIBUTES[:number],
        :message => "valid message"
      )

      expect(resp.success?).to eq(false)
    end
  end
end
