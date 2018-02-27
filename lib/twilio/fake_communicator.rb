module Twilio
  class FakeCommunicator
    HTTP_ERROR_USER_ATTRIBUTES = {
      :number => "fake_number"
    }.freeze

    HTTP_ERROR_TOKEN = "BAD_TOKEN".freeze

    BAD_TO_NUMBER_MESSAGE = "[HTTP 400] 21211 : Unable to create record: The 'To' number fake_number is not a valid phone number.".freeze
    BAD_FROM_NUMBER_MESSAGE = "[HTTP 400] 21211 : Unable to create record: The 'From' number fake_number is not a valid phone number.".freeze
    BAD_TOKEN_MESSAGE = "[HTTP 404] 20404 : Unable to create record: The requested resource /2010-04-01/Accounts/BAD_TOKEN/Messages.json was not found".freeze

    def initialize(account_sid, auth_token, from_number)
      @account_sid = account_sid
      @auth_token = auth_token
      @from_number = from_number
    end

    def send_sms_message(to_number:, message:)
      if to_number == HTTP_ERROR_USER_ATTRIBUTES[:number]
        return OpenStruct.new(
          :success? => false,
          :message => BAD_TO_NUMBER_MESSAGE
        )
      end

      if @from_number == HTTP_ERROR_USER_ATTRIBUTES[:number]
        return OpenStruct.new(
          :success? => false,
          :message => BAD_FROM_NUMBER_MESSAGE
        )
      end

      if @account_sid == HTTP_ERROR_TOKEN || @auth_token == HTTP_ERROR_TOKEN
        return OpenStruct.new(
          :success? => false,
          :message => BAD_TOKEN_MESSAGE
        )
      end
      OpenStruct.new(:success? => true)
    end
  end
end
