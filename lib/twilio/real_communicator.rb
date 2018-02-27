require "twilio-ruby"

module Twilio
  class RealCommunicator
    def initialize(account_sid, auth_token, from_number)
      @from_number = from_number
      @twilio_client = Twilio::REST::Client.new(account_sid, auth_token)
    end

    def send_sms_message(to_number:, message:)
      @twilio_client.api.account.messages.create(
        :from => @from_number,
        :to => to_number,
        :body => message
      )

      OpenStruct.new(:success? => true)
    rescue Twilio::REST::RestError => e
      OpenStruct.new(:success? => false, :message => e.to_s)
    end
  end
end
