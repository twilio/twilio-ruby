require '../lib/twiliolib.rb'

module AccountExampleHelperMethods

  def bad_append(verb)
    
    lambda {verb.append(Twilio::Response)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Say)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Play)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Gather)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Record)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Redirect)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Hangup)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Pause)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Number)}.should raise_error(ArgumentError)     
    lambda {verb.append(Twilio::Sms)}.should raise_error(ArgumentError)     
    lambda {verb.append(Twilio::Conference)}.should raise_error(ArgumentError)     
    
  end
  
  def bad_attr(verb)
    lambda {verb.new(:crazy => 'delicious')}.should raise_error(ArgumentError) 
  end

end

describe Twilio::Response do
  include AccountExampleHelperMethods
  
  it "should be an empty response" do
    @r = Twilio::Response.new
    @r.respond.should == '<Response></Response>'
  end
  
  it "add attribute" do
    @r = Twilio::Response.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Response crazy="delicious"></Response>'
  end
  
  it "bad attribute" do
    bad_attr(Twilio::Response)
  end
  
end

describe Twilio::Say do
  include AccountExampleHelperMethods

  it "should say hello monkey" do
    @r = Twilio::Response.new
    @r.append(Twilio::Say.new("Hello Monkey"))
    @r.respond.should == '<Response><Say>Hello Monkey</Say></Response>'
  end
  
  it "should say hello monkey and loop 3 times" do
    @r = Twilio::Response.new
    @r.append(Twilio::Say.new("Hello Monkey", :loop => 3))
    @r.respond.should == '<Response><Say loop="3">Hello Monkey</Say></Response>'
  end
  
  it "should say have a woman say hello monkey and loop 3 times" do
    @r = Twilio::Response.new
    @r.append(Twilio::Say.new("Hello Monkey", :voice => 'woman'))
    @r.respond.should == '<Response><Say voice="woman">Hello Monkey</Say></Response>'
  end
  
  it "should say have a woman say hello monkey and loop 3 times and be in french" do
    @r = Twilio::Response.new
    @r.append(Twilio::Say.new("Hello Monkey", :language => 'fr'))
    @r.respond.should == '<Response><Say language="fr">Hello Monkey</Say></Response>'
  end
  
  it "convenience method: should say have a woman say hello monkey and loop 3 times and be in french" do
    @r = Twilio::Response.new
    @r.addSay "Hello Monkey", :language => 'fr'
    @r.respond.should == '<Response><Say language="fr">Hello Monkey</Say></Response>'
  end
  
  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Say.new("Hello Monkey"))
    bad_append @s
  end
  
  it "add attribute" do
    @r = Twilio::Say.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Say crazy="delicious"></Say>'
  end

end

describe Twilio::Play do
  include AccountExampleHelperMethods
  
  it "should play hello monkey" do
    @r = Twilio::Response.new
    @r.append(Twilio::Play.new("Hello Monkey.mp3"))
    @r.respond.should == '<Response><Play>Hello Monkey.mp3</Play></Response>'
  end
  
  it "should play hello monkey" do 
    @r = Twilio::Response.new
    @r.append(Twilio::Play.new("Hello Monkey.mp3", :loop => '3'))
    @r.respond.should == '<Response><Play loop="3">Hello Monkey.mp3</Play></Response>'
  end
  
  it "convenience method: should play hello monkey" do 
    @r = Twilio::Response.new
    @r.addPlay "Hello Monkey.mp3", :loop => '3'
    @r.respond.should == '<Response><Play loop="3">Hello Monkey.mp3</Play></Response>'
  end
  
  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Play.new("Hello Monkey.mp3", :loop => '3'))
    bad_append @s
  end
  
  it "add attribute" do
    @r = Twilio::Play.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Play crazy="delicious"></Play>'
  end

end

describe Twilio::Record do
  include AccountExampleHelperMethods
  
  it "should record" do
    @r = Twilio::Response.new
    @r.append(Twilio::Record.new())
    @r.respond.should == '<Response><Record></Record></Response>'
  end
  
  it "should record with an action and a get method" do 
    r = Twilio::Response.new
    r.append(Twilio::Record.new(:action => "example.com", :method => 'GET'))
    r.respond.should == '<Response><Record action="example.com" method="GET"></Record></Response>'
  end
  
  it "should record with an maxlength, finishonkey, and timeout" do 
    r = Twilio::Response.new
    r.append(Twilio::Record.new(:timeout => "4", :finishOnKey => '#', :maxLength => "30"))
    r.respond.should == '<Response><Record timeout="4" finishOnKey="#" maxLength="30"></Record></Response>'
  end
  
  it "should record with a transcribe and transcribeCallback" do 
    r = Twilio::Response.new
    r.append(Twilio::Record.new(:transcribeCallback => 'example.com'))
    r.respond.should == '<Response><Record transcribeCallback="example.com"></Record></Response>'
  end
  
  it "convenience methods: should record with a transcribe and transcribeCallback" do 
    r = Twilio::Response.new
    r.addRecord :transcribeCallback => 'example.com'
    r.respond.should == '<Response><Record transcribeCallback="example.com"></Record></Response>'
  end
  
  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Record.new())
    bad_append @s
  end
  
  it "add attribute" do
    @r = Twilio::Record.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Record crazy="delicious"></Record>'
  end

end


describe Twilio::Redirect do
  include AccountExampleHelperMethods
  
  it "should redirect" do
    @r = Twilio::Response.new
    @r.append(Twilio::Redirect.new())
    @r.respond.should == '<Response><Redirect></Redirect></Response>'
  end
  
  it "should redirect to a url via POST" do 
    @r = Twilio::Response.new
    @r.append(Twilio::Redirect.new("example.com", :method => "POST"))
    @r.respond.should == '<Response><Redirect method="POST">example.com</Redirect></Response>'
  end
 
  it "convenience: should redirect to a url via POST" do 
    @r = Twilio::Response.new
    @r.addRedirect "example.com", :method => "POST"
    @r.respond.should == '<Response><Redirect method="POST">example.com</Redirect></Response>'
  end 

  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Redirect.new())
    bad_append @s
  end
  
  it "add attribute" do
    @r = Twilio::Redirect.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Redirect crazy="delicious"></Redirect>'
  end


end

describe Twilio::Hangup do
  include AccountExampleHelperMethods
  
  it "should redirect" do
    @r = Twilio::Response.new
    @r.append(Twilio::Hangup.new())
    @r.respond.should == '<Response><Hangup></Hangup></Response>'
  end
 
  it "convenience: should Hangup to a url via POST" do 
    @r = Twilio::Response.new
    @r.addHangup
    @r.respond.should == '<Response><Hangup></Hangup></Response>'
  end 

  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Hangup.new())
    bad_append @s
  end
  
  it "add attribute" do
    @r = Twilio::Hangup.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Hangup crazy="delicious"></Hangup>'
  end

end

describe Twilio::Sms do
  include AccountExampleHelperMethods
  
  it "should send a sms message" do
    @r = Twilio::Response.new
    @r.append(Twilio::Sms.new("Hello, World"))
    @r.respond.should == '<Response><Sms>Hello, World</Sms></Response>'
  end
 
  it "convenience: should send a sms message" do 
    @r = Twilio::Response.new
    @r.addSms "Hello, World"
    @r.respond.should == '<Response><Sms>Hello, World</Sms></Response>'
  end 

  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Sms.new("Hello World"))
    bad_append @s
  end
  
  it "should send sms to to and from from with status callback" do
    @r = Twilio::Response.new
    @r.append(Twilio::Sms.new("Hello, World", :to => 1231231234, 
      :from => 3453453456, :statusCallback => "example.com?id=34&action=hey"))
    @r.respond.should == '<Response><Sms from="3453453456" statusCallback="example.com?id=34&amp;action=hey" to="1231231234">Hello, World</Sms></Response>'
  end
  
  
  it "add attribute" do
    @r = Twilio::Sms.new
    @r.set :foo => 'bar'
    @r.respond.should == '<Sms foo="bar"></Sms>'
  end

end

describe Twilio::Pause do
  include AccountExampleHelperMethods
  
  it "should redirect" do
    @r = Twilio::Response.new
    @r.append(Twilio::Pause.new())
    @r.respond.should == '<Response><Pause></Pause></Response>'
  end
 
  it "convenience: should Pause to a url via POST" do 
    @r = Twilio::Response.new
    @r.addPause :length => '4'
    @r.respond.should == '<Response><Pause length="4"></Pause></Response>'
  end 

  it "should raises exceptions for wrong appending" do
    @r = Twilio::Response.new
    @s = @r.append(Twilio::Pause.new())
    bad_append @s
  end
  
  it "add attribute" do
    @r = Twilio::Pause.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Pause crazy="delicious"></Pause>'
  end

end

describe Twilio::Dial do
  include AccountExampleHelperMethods
  
  it "should redirect" do
    @r = Twilio::Response.new
    @r.append(Twilio::Dial.new("1231231234"))
    @r.respond.should == '<Response><Dial>1231231234</Dial></Response>'
  end
 
  it "convenience: should Hangup to a url via POST" do 
    @r = Twilio::Response.new
    @r.addDial
    @r.respond.should == '<Response><Dial></Dial></Response>'
  end 

  it "add a number to a dial" do
    @r = Twilio::Response.new
    @d = @r.append(Twilio::Dial.new())
    @d.append(Twilio::Number.new("1231231234"))
    @r.respond.should == '<Response><Dial><Number>1231231234</Number></Dial></Response>'
  end
  
  it "convenience: add a number to a dial" do
    @r = Twilio::Response.new
    @d = @r.addDial
    @d.addNumber "1231231234"
    @r.respond.should == '<Response><Dial><Number>1231231234</Number></Dial></Response>'
  end
  
  
  it "add a conference to a dial" do
    @r = Twilio::Response.new
    @d = @r.append(Twilio::Dial.new())
    @d.append(Twilio::Conference.new("MyRoom"))
    @r.respond.should == '<Response><Dial><Conference>MyRoom</Conference></Dial></Response>'
  end
  
  
  it "convenience: add a conference to a dial" do
    @r = Twilio::Response.new
    @d = @r.addDial
    @d.addConference "MyRoom"
    @r.respond.should == '<Response><Dial><Conference>MyRoom</Conference></Dial></Response>'
  end
  
  it "add attribute" do
    @r = Twilio::Dial.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Dial crazy="delicious"></Dial>'
  end
  
  it "bad append" do
    verb = Twilio::Dial.new
    lambda {verb.append(Twilio::Response)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Say)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Play)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Gather)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Record)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Redirect)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Hangup)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Pause)}.should raise_error(ArgumentError)     
  end

end

describe Twilio::Gather do
  include AccountExampleHelperMethods
  
  it "should redirect" do
    @r = Twilio::Response.new
    @r.append(Twilio::Gather.new("1231231234"))
    @r.respond.should == '<Response><Gather>1231231234</Gather></Response>'
  end
 
  it "convenience: should Hangup to a url via POST" do 
    @r = Twilio::Response.new
    @r.addGather
    @r.respond.should == '<Response><Gather></Gather></Response>'
  end 

  it "add a number to a Gather" do
    @r = Twilio::Response.new
    @g = @r.append(Twilio::Gather.new)
    @g.append(Twilio::Say.new("Hello World"))
    @g.append(Twilio::Play.new("Hello World.mp3"))
    @g.append(Twilio::Pause.new)
    @r.respond.should == '<Response><Gather><Say>Hello World</Say><Play>Hello World.mp3</Play><Pause></Pause></Gather></Response>'
  end
  
  it "convenience: add a number to a Gather" do
    @r = Twilio::Response.new
    @g = @r.addGather
    @g.addSay "Hello World"
    @g.addPlay "Hello World.mp3"
    @g.addPause
    @r.respond.should == '<Response><Gather><Say>Hello World</Say><Play>Hello World.mp3</Play><Pause></Pause></Gather></Response>'
  end
  
  it "add attribute" do
    @r = Twilio::Gather.new
    @r.set :crazy => 'delicious'
    @r.respond.should == '<Gather crazy="delicious"></Gather>'
  end
  
  it "bad append" do
    verb = Twilio::Gather.new
    lambda {verb.append(Twilio::Response)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Gather)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Record)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Redirect)}.should raise_error(ArgumentError)
    lambda {verb.append(Twilio::Hangup)}.should raise_error(ArgumentError)   
  end

end

describe Twilio::Utils do
  
  it "check a signed sinature" do
    
    # This is the signature we expect for the key, url, and params below
    expected_sig = 'Ma7fvTryuU51vDGO2IT5/KhivpI='
  
    # this is the secret key for your account
    AuthToken = 'a1b2c3d4'
    utils = Twilio::Utils.new(AuthToken, "34");
    # this is the url that twilio requested
    url = 'http://yourserver.com/twilio/index.php?id=12345&encodedtext=hello+world'
    
    # these are the post params twilio sent in its request
    params = Hash.new
    params['second_post_param'] = 'world'
    params['first_post_param'] = 'hello'
    
    # sort the params alphabetically, and append the key and value of each to the url
    signature = utils.validateRequest(expected_sig, url, params)
    
    # calculate the hmacsha1 signature of the data using the key and return it in base64 format
    signature.should == true
  
  end

end