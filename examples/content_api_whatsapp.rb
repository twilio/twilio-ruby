#!/usr/bin/env ruby

# Add the lib directory to the load path for development
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'twilio-ruby'

# Your Account SID and Auth Token from console.twilio.com
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'your_auth_token'

# Initialize the Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

puts "=== WhatsApp Content API Examples ==="

# Example 1: WhatsApp Authentication Template
puts "\n1. Creating WhatsApp Authentication Content"
whatsapp_auth_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "whatsapp_authentication" => Twilio::REST::Content::V1::ContentList::WhatsappAuthentication.new({
    "add_security_recommendation" => true,
    "code_expiration_minutes" => 10,
    "actions" => [
      Twilio::REST::Content::V1::ContentList::AuthenticationAction.new({
        "type" => "COPY_CODE",
        "copy_code_text" => "Copy Code"
      })
    ]
  })
})

whatsapp_auth_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "WhatsApp Authentication Template",
  "language" => "en",
  "types" => whatsapp_auth_types
})

begin
  whatsapp_auth_content = @client.content.v1.contents.create(content_create_request: whatsapp_auth_request)
  puts "WhatsApp authentication content created: #{whatsapp_auth_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating WhatsApp auth content: #{e.message}"
end

# Example 2: WhatsApp Card Template
puts "\n2. Creating WhatsApp Card Content"
whatsapp_card_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "whatsapp_card" => Twilio::REST::Content::V1::ContentList::WhatsappCard.new({
    "header_text" => "Welcome to Our Service",
    "body" => "Welcome to our WhatsApp Business! {{1}}",
    "footer" => "Powered by Twilio",
    "media" => ["https://example.com/whatsapp-header.jpg"],
    "actions" => [
      Twilio::REST::Content::V1::ContentList::CardAction.new({
        "type" => "URL",
        "title" => "Visit Website",
        "url" => "https://www.example.com"
      }),
      Twilio::REST::Content::V1::ContentList::CardAction.new({
        "type" => "PHONE_NUMBER",
        "title" => "Call Us",
        "phone" => "+1234567890"
      })
    ]
  })
})

whatsapp_card_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "WhatsApp Business Card Template",
  "language" => "en",
  "variables" => {
    "1" => "customer_name"
  },
  "types" => whatsapp_card_types
})

begin
  whatsapp_card_content = @client.content.v1.contents.create(content_create_request: whatsapp_card_request)
  puts "WhatsApp card content created: #{whatsapp_card_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating WhatsApp card content: #{e.message}"
end

# Example 3: WhatsApp Flows Template
puts "\n3. Creating WhatsApp Flows Content"
flows_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_flows" => Twilio::REST::Content::V1::ContentList::TwilioFlows.new({
    "body" => "Start our interactive booking flow",
    "button_text" => "Book Appointment",
    "subtitle" => "Easy appointment scheduling",
    "media_url" => "https://example.com/flows-preview.jpg",
    "type" => "booking",
    "pages" => [
      Twilio::REST::Content::V1::ContentList::FlowsPage.new({
        "id" => "page1",
        "title" => "Select Service",
        "subtitle" => "Choose the service you need",
        "layout" => [
          Twilio::REST::Content::V1::ContentList::FlowsPageComponent.new({
            "type" => "dropdown",
            "label" => "Service Type"
          })
        ]
      }),
      Twilio::REST::Content::V1::ContentList::FlowsPage.new({
        "id" => "page2", 
        "title" => "Select Date & Time",
        "subtitle" => "Pick your preferred slot",
        "layout" => [
          Twilio::REST::Content::V1::ContentList::FlowsPageComponent.new({
            "type" => "date_picker",
            "label" => "Appointment Date"
          }),
          Twilio::REST::Content::V1::ContentList::FlowsPageComponent.new({
            "type" => "time_picker",
            "label" => "Appointment Time"
          })
        ]
      })
    ]
  })
})

flows_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "WhatsApp Booking Flow Template",
  "language" => "en",
  "types" => flows_types
})

begin
  flows_content = @client.content.v1.contents.create(content_create_request: flows_request)
  puts "WhatsApp flows content created: #{flows_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating WhatsApp flows content: #{e.message}"
end

# Example 4: Multi-language WhatsApp Template
puts "\n4. Creating Multi-language WhatsApp Content"
# Spanish version
spanish_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_text" => Twilio::REST::Content::V1::ContentList::TwilioText.new({
    "body" => "¡Hola {{1}}! Gracias por contactarnos. ¿En qué podemos ayudarte hoy?"
  })
})

spanish_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "WhatsApp Greeting - Spanish",
  "language" => "es",
  "variables" => {
    "1" => "customer_name"
  },
  "types" => spanish_types
})

begin
  spanish_content = @client.content.v1.contents.create(content_create_request: spanish_request)
  puts "Spanish WhatsApp content created: #{spanish_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating Spanish content: #{e.message}"
end

# French version  
french_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_text" => Twilio::REST::Content::V1::ContentList::TwilioText.new({
    "body" => "Bonjour {{1}} ! Merci de nous avoir contactés. Comment pouvons-nous vous aider aujourd'hui ?"
  })
})

french_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "WhatsApp Greeting - French",
  "language" => "fr",
  "variables" => {
    "1" => "customer_name"
  },
  "types" => french_types
})

begin
  french_content = @client.content.v1.contents.create(content_create_request: french_request)
  puts "French WhatsApp content created: #{french_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating French content: #{e.message}"
end

# Example 5: Schedule/Appointment Template
puts "\n5. Creating WhatsApp Schedule Content"
schedule_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_schedule" => Twilio::REST::Content::V1::ContentList::TwilioSchedule.new({
    "id" => "appointment_booking",
    "title" => "Book your appointment with us!",
    "time_slots" => "09:00-17:00"
  })
})

schedule_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "WhatsApp Appointment Scheduler",
  "language" => "en",
  "types" => schedule_types
})

begin
  schedule_content = @client.content.v1.contents.create(content_create_request: schedule_request)
  puts "Schedule content created: #{schedule_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating schedule content: #{e.message}"
end

puts "\n=== Filtering WhatsApp Content ==="
# Filter content by language and type
begin
  whatsapp_contents = @client.content.v2.contents.list(
    language: ['en', 'es', 'fr'],
    limit: 20
  )
  
  puts "WhatsApp content templates by language:"
  languages = {}
  whatsapp_contents.each do |content|
    lang = content.language || 'unknown'
    languages[lang] ||= 0
    languages[lang] += 1
  end
  
  languages.each do |lang, count|
    puts "#{lang}: #{count} templates"
  end
rescue Twilio::REST::TwilioError => e
  puts "Error filtering content: #{e.message}"
end