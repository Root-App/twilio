module Twilio
  class Gateway
    module Strategy
      REAL = "real".freeze
      FAKE = "fake".freeze
    end

    def initialize(config)
      config.assert_valid_keys(:communicator_strategy, :account_sid, :auth_token, :from_number)
      @account_sid = config[:account_sid]
      @auth_token = config[:auth_token]
      @from_number = config[:from_number]
      @communicator_strategy = config[:communicator_strategy]
    end

    def send_sms_message(to_number:, message:)
      _communicator.send_sms_message(:to_number => to_number, :message => message)
    end

    private

    def _communicator
      case @communicator_strategy
      when Strategy::REAL then RealCommunicator.new(@account_sid, @auth_token, @from_number)
      when Strategy::FAKE then FakeCommunicator.new(@account_sid, @auth_token, @from_number)
      else
        raise "invalid communicator strategy: #{@communicator_strategy.inspect}" # rubocop:disable RaiseI18n
      end
    end
  end
end
