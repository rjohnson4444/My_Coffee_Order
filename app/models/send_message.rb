require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
class SendMessage

  def self.text
    account_sid = 'AC2eb5874bc5580bf392654c9381f1b7ae'
    auth_token  =  "2ad9acc648ef6b4f11e889709b928d18"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+17604528410', :to => '+18587227866', :body => "your order was succefully placed"
    })
  end
end
