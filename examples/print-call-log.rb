require 'rubygems'
require 'twilio-ruby'

# print a list of all phone calls, what phone number each was to/from, and how
# much each one cost.

# put your Twilio credentials here. you can find your AccountSid and AuthToken
# at the top of your account dashboard page located at:
#   https://www.twilio.com/user/account
account_sid = 'AC043dcf9844e04758bc3a36a84c29761'
auth_token = '62ea81de3a5b414154eb263595357c69'

# set up a client
client = Twilio::REST::Client.new(account_sid, auth_token)

calls = client.calls.list

begin
  calls.each do |call|
    price = call.price || '0.00' # since apparently prices can be nil...
    puts call.sid + "\t" + call.from + "\t" + call.to + "\t" + price
  end
  calls = calls.next_page
end while not calls.empty?
