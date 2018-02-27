require "spec_helper"

RSpec.describe Twilio::Gateway do
  context "with the real communicator strategy", :full_stack => true do
    let(:gateway) { described_class.new(SpecHelper.real_config) }

    it "uses the real communicator" do
      expect(gateway.send(:_communicator)).to be_kind_of(Twilio::RealCommunicator)
    end
  end

  context "with the fake communicator strategy" do
    let(:gateway) { described_class.new(SpecHelper.fake_config) }

    it "uses the fake communicator" do
      expect(gateway.send(:_communicator)).to be_kind_of(Twilio::FakeCommunicator)
    end
  end
end

