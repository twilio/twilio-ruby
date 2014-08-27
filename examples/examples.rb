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
@client.accounts.get(@account_sid).update(friendly_name: 'A Fabulous Friendly Name')

################ CALLS ################

# print a list of calls (all parameters optional)
@account.calls.list(
  page: 0,
  page_size: 1000,
  start_time: '2010-09-01'
).each do |call|
  puts call.sid
end

# get a particular call and list its recording urls
@account.calls.get('CAXXXXXXX').recordings.list.each do |r|
  puts r.wav
end

# make a new outgoing call. returns a call object just like calls.get
@call = @account.calls.create(
  from: '+14159341234',
  to: '+18004567890',
  url: 'http://example.com/call-handler'
)

# cancel the call if not already in progress
@account.calls.get(@call.sid).update(status: 'canceled')
# or equivalently
@call.update(status: 'canceled')
# or simply
@call.cancel

# redirect and then terminate a call
@call = @account.calls.get('CA386025c9bf5d6052a1d1ea42b4d16662')
@call.update(url: 'http://example.com/call-redirect')
@call.update(status: 'completed')
# or, use the aliases...
@call.redirect_to('http://example.com/call-redirect')
@call.hangup

################ SMS MESSAGES ################

# print a list of messages
@account.messages.list(date_sent: '2010-09-01').each do |message|
  puts message.body
end

# print a particular sms message
puts @account.messages.get('SMXXXXXXXX').body

# send an sms
@account.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)

# send an mms
@account.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  media_urls: 'http://example.com/media.png'
)

################ PHONE NUMBERS ################

# get a list of supported country codes
@account.available_phone_numbers.list

# print some available numbers
@numbers = @account.available_phone_numbers.get('US').local.list(
  contains: 'AWESOME'
)
@numbers.each { |num| puts num.phone_number }

# buy the first one
@account.incoming_phone_numbers.create(phone_number: @numbers[0].phone_number)

# update an existing phone number's voice url
number = @account.incoming_phone_numbers.get('PNdba508c5616a7f5e141789f44f022cc3')
number.update(voice_url: 'http://example.com/voice')

# decommission an existing phone number
numbers = @account.incoming_phone_numbers.list(
  friendly_name: 'A Fabulous Friendly Name'
)
numbers[0].delete
################ CONFERENCES  ################

# get a particular conference's participants object and stash it
conference = @account.conferences.get('CFbbe46ff1274e283f7e3ac1df0072ab39')
@participants = conference.participants

# list participants
@participants.list.each do |p|
  puts p.sid
end

# update a conference participant
@participants.get('CA386025c9bf5d6052a1d1ea42b4d16662').update(muted: 'true')
# or an easier way
@participants.get('CA386025c9bf5d6052a1d1ea42b4d16662').mute

# and, since we're lazy loading, this would only incur one http request
@account.conferences.get('CFbbe46ff1274e283f7e3ac1df0072ab39').participants
  .get('CA386025c9bf5d6052a1d1ea42b4d16662').update(muted: 'true')

################ QUEUES ###################

# create a new queue
@queue = @account.queues.create(friendly_name: 'MyQueue', max_size: 50)

# get a list of queues for this account
@queues = @account.queues.list

# get a particular queue and its members
@queue = @account.queues.get("QQb6765b0458714964970a73dcaf55efd1")
@members = @queue.members

#list members
@members.list.each do |m|
  puts m.wait_time
end

# dequeue a particular user and run twiml at a specific url
@member = @members.get('CA386025c9bf5d6052a1d1ea42b4d16662')
@member.dequeue('http://myapp.com/deque')
