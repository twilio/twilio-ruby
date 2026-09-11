#!/usr/bin/env ruby

# Add the lib directory to the load path for development
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'twilio-ruby'

# Your Account SID and Auth Token from console.twilio.com
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'your_auth_token'

# Initialize the Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

puts "=== Basic Content API Examples ==="

# Example 1: Text Content
puts "\n1. Creating Text Content"
text_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_text" => Twilio::REST::Content::V1::ContentList::TwilioText.new({
    "body" => "Hello {{1}}, this is a text message!"
  })
})

text_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Text Message Template",
  "language" => "en",
  "variables" => {
    "1" => "customer_name"
  },
  "types" => text_types
})

begin
  text_content = @client.content.v1.contents.create(content_create_request: text_request)
  puts "Text content created: #{text_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating text content: #{e.message}"
end

# Example 2: Media Content (text + images/videos)
puts "\n2. Creating Media Content"
media_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_media" => Twilio::REST::Content::V1::ContentList::TwilioMedia.new({
    "body" => "Check out this amazing offer {{1}}!",
    "media" => [
      "https://example.com/image1.jpg",
      "https://example.com/image2.jpg"
    ]
  })
})

media_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Media Message Template",
  "language" => "en", 
  "variables" => {
    "1" => "offer_details"
  },
  "types" => media_types
})

begin
  media_content = @client.content.v1.contents.create(content_create_request: media_request)
  puts "Media content created: #{media_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating media content: #{e.message}"
end

# Example 3: Location Content
puts "\n3. Creating Location Content"
location_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_location" => Twilio::REST::Content::V1::ContentList::TwilioLocation.new({
    "latitude" => 37.7749,
    "longitude" => -122.4194,
    "label" => "Twilio HQ",
    "address" => "375 Beale St, San Francisco, CA 94105"
  })
})

location_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Location Share Template",
  "language" => "en",
  "types" => location_types
})

begin
  location_content = @client.content.v1.contents.create(content_create_request: location_request)
  puts "Location content created: #{location_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating location content: #{e.message}"
end

# Example 4: Quick Reply Content
puts "\n4. Creating Quick Reply Content"
quick_reply_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_quick_reply" => Twilio::REST::Content::V1::ContentList::TwilioQuickReply.new({
    "body" => "How can we help you today?",
    "actions" => [
      Twilio::REST::Content::V1::ContentList::QuickReplyAction.new({
        "type" => "QUICK_REPLY",
        "id" => "support",
        "title" => "Get Support"
      }),
      Twilio::REST::Content::V1::ContentList::QuickReplyAction.new({
        "type" => "QUICK_REPLY",
        "id" => "billing", 
        "title" => "Billing Questions"
      }),
      Twilio::REST::Content::V1::ContentList::QuickReplyAction.new({
        "type" => "QUICK_REPLY",
        "id" => "sales",
        "title" => "Talk to Sales"
      })
    ]
  })
})

quick_reply_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Quick Reply Menu Template",
  "language" => "en",
  "types" => quick_reply_types
})

begin
  quick_reply_content = @client.content.v1.contents.create(content_create_request: quick_reply_request)
  puts "Quick reply content created: #{quick_reply_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating quick reply content: #{e.message}"
end

puts "\n=== Listing Content Templates ==="
# List all content templates
begin
  contents = @client.content.v1.contents.list(limit: 10)
  contents.each do |content|
    puts "Content: #{content.friendly_name} (#{content.sid}) - Language: #{content.language}"
  end
rescue Twilio::REST::TwilioError => e
  puts "Error listing content: #{e.message}"
end