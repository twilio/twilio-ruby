require 'twiliolib'

# ===========================================================================
# 1. Say, Dial, and Play
@r = Twilio::Response.new
@r.append(Twilio::Say.new("Hello World", :voice => "man", :loop => "10"))
@r.append(Twilio::Dial.new("4155551212", :timeLimit => "45"))
@r.append(Twilio::Play.new("http://www.mp3.com"))
puts @r.respond

#<Response>
#  <Say voice="man" loop="10">Hello World</Say>
#  <Play>http://www.mp3.com</Play>
#  <Dial timeLimit="45">4155551212</Dial>
#</Response>


# ===========================================================================
# 2. Gather, Redirect 
@r = Twilio::Response.new;
@g = @r.append(Twilio::Gather.new(:numDigits => "10"))
@g.append(Twilio::Say.new("Press 1"))
@r.append(Twilio::Redirect.new())
puts @r.respond


#<Response>
#  <Gather numDigits="1">
#    <Say>Press 1</Say>
#  </Gather>
#  <Redirect/>
#</Response>


# ===========================================================================
# 3. Add a Say verb multiple times
@r = Twilio::Response.new
@say = Twilio::Say.new("Press 1")
@r.append(@say);
@r.append(@say);
puts @r.respond

#<Response>
#  <Say>Press 1</Say>
#  <Say>Press 1</Say>
#</Response>

# ===========================================================================
# 3. Create a Conference Call
@r = Twilio::Response.new
@d = Twilio::Dial.new
@d.append(Twilio::Conference.new("MyRoom", :startConferenceOnEnter => "true"))
@r.append(@d);
puts @r.respond

#<Response>
#  <Say>Press 1</Say>
#  <Say>Press 1</Say>
#</Response>

# ===========================================================================
# 4. Set any attribute / value pair
  
@r = Twilio::Response.new
@rd = Twilio::Redirect.new
@rd.set(:crazy => "delicious")
@r.append(@rd)
puts @r.respond


#<Response>
#  <Redirect crazy="delicious"/>
#<Response>

# ===========================================================================
# 5. Convenience methods
@r = Twilio::Response.new
@r.addSay "Hello World", :voice => "man", :language => "fr", :loop => "10"
@d = @r.addDial :timeLimit => "45"
@d.addConference("MyRoom")
@r.addPlay "http://www.mp3.com"
puts @r.respond

#<Response>
#  <Say voice="man" language="fr" loop="10">Hello World</Say>
#  <Play>http://www.mp3.com</Play>
#  <Dial timeLimit="45">4155551212</Dial>
#</Response>

