# examples version 3

@account_sid = 'AC043dcf9844e04758bc3a36a84c29761'
@auth_token = '62ea81de3a5b414154eb263595357c69'
# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)

################ ACCOUNTS ################

# shortcut to grab your account object (account_sid is inferred from the client's auth credentials)
@account = @client.account 

# list your (sub)accounts
@client.accounts.list

# grab an account instance resource if you know the sid
@account = @client.accounts.get(@account_sid)
# http round trip happens here
puts @account.friendly_name

# update an account's friendly name
@client.accounts.get(@account_sid).update(:friendly_name => 'A Fabulous Friendly Name')

################ CALLS ################

# print a list of calls (all parameters optional)
@account.calls.list({:page => 0, :page_size => 1000, :start_time => '2010-09-01'}).each do |call|
  puts call.sid
end

# get a particular call and list its recording urls
@account.calls.get('CAXXXXXXX').recordings.list.each do {|r| puts r.wav}

# make a new outgoing call. returns a call object just like calls.get
@call = @account.calls.create({:from => '+14159341234', :to => '+18004567890', :url => 'http://example.com/call-handler'})

# cancel the call if not already in progress
@account.calls.get(@call.sid).update({:status => 'canceled'})
# or equivalently
@call.update({:status => 'canceled'})
# or simply
@call.cancel

# redirect and then terminate a call
@account.calls.get('CA386025c9bf5d6052a1d1ea42b4d16662').update({:url => 'http://example.com/call-redirect'})
@account.calls.get('CA386025c9bf5d6052a1d1ea42b4d16662').update({:status => 'completed'})
# or, use the aliases...
@call.redirect_to('http://example.com/call-redirect')
@call.hangup

################ SMS MESSAGES ################

# print a list of sms messages
@account.sms.messages.list({:date_sent => '2010-09-01'}).each do |sms|
  puts sms.body
end

# print a particular sms message
puts @account.sms.messages.get('SMXXXXXXXX').body

# send an sms
@account.sms.messages.create(:from => '+14159341234', :to => '+16105557069', :body => 'Hey there!')

################ PHONE NUMBERS ################

# get a list of supported country codes
@account.available_phone_numbers.list

# print some available numbers
@numbers = @account.available_phone_numbers.get('US').local.list({:contains => 'AWESOME'})
@numbers.each {|num| puts num.phone_number}

# buy the first one
@account.incoming_phone_numbers.create(:phone_number => @numbers[0].phone_number)

# update an existing phone number's voice url
@account.incoming_phone_numbers.get('PNdba508c5616a7f5e141789f44f022cc3').update({:voice_url => 'http://example.com/voice'})

################ CONFERENCES  ################

# get a particular conference's participants object and stash it
@participants = @account.conferences.get('CFbbe46ff1274e283f7e3ac1df0072ab39').participants

# list participants
@participants.list.each do {|p| puts p.sid}

# update a conference participant
@participants.get('CA386025c9bf5d6052a1d1ea42b4d16662').update({:muted => 'true'})
# or an easier way
@participants.get('CA386025c9bf5d6052a1d1ea42b4d16662').mute

# and, since we're lazy loading, this would only incur one http request
@account.conferences.get('CFbbe46ff1274e283f7e3ac1df0072ab39').participants.get('CA386025c9bf5d6052a1d1ea42b4d16662').update({:muted => 'true'})
