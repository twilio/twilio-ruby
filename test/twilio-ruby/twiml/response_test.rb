require 'rubygems'
require 'twilio-ruby'
require 'fakeweb'

describe Twilio::TwiML::Response do
  it "equates two responses" do
    (Twilio::TwiML::Response.new{|r| r.Say 'hello there'} == Twilio::TwiML::Response.new{|r| r.Say 'hello there'}).should be_true
    (Twilio::TwiML::Response.new{|r| r.Say 'hello there'}.eql(Twilio::TwiML::Response.new{|r| r.Say 'hello there'})).should be_true
  end

  it "identifies different responses" do
    (Twilio::TwiML::Response.new{|r| r.Say 'hello there'} == Twilio::TwiML::Response.new{|r| r.Say 'goodbye'}).should be_false
    (Twilio::TwiML::Response.new{|r| r.Say 'hello there'}.eql(Twilio::TwiML::Response.new{|r| r.Say 'goodbye'})).should be_false
  end
end
