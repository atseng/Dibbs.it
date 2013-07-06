require 'twilio-ruby'

class TwilioMessenger


  def initialize(to_user)
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @to_user = to_user
  end


  def send_text(message)
    if @to_user.receives_notifications
      @client.account.sms.messages.create(
          :body => message,
          :to => "+#{@to_user.phone_number}",
          :from => "+17819168563")
    end
  end

end
