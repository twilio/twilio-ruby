#!/usr/bin/env ruby

# Add the lib directory to the load path for development
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'twilio-ruby'

# Your Account SID and Auth Token from console.twilio.com
account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
auth_token = 'your_auth_token'

# Initialize the Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

puts "=== Advanced Content API Examples ==="

# Example 1: Call to Action Content
puts "\n1. Creating Call to Action Content"
call_to_action_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_call_to_action" => Twilio::REST::Content::V1::ContentList::TwilioCallToAction.new({
    "body" => "Ready to get started? Choose an option below:",
    "actions" => [
      Twilio::REST::Content::V1::ContentList::CallToActionAction.new({
        "type" => "URL",
        "title" => "Visit Website",
        "url" => "https://www.example.com"
      }),
      Twilio::REST::Content::V1::ContentList::CallToActionAction.new({
        "type" => "PHONE_NUMBER", 
        "title" => "Call Us",
        "phone" => "+1234567890"
      })
    ]
  })
})

cta_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Call to Action Template",
  "language" => "en",
  "types" => call_to_action_types
})

begin
  cta_content = @client.content.v1.contents.create(content_create_request: cta_request)
  puts "Call to action content created: #{cta_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating call to action content: #{e.message}"
end

# Example 2: Card Content
puts "\n2. Creating Card Content"
card_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_card" => Twilio::REST::Content::V1::ContentList::TwilioCard.new({
    "title" => "{{1}}",
    "subtitle" => "Special offer just for you!",
    "body" => "Get {{2}}% off your next purchase. Limited time offer!",
    "media" => "https://example.com/product-image.jpg",
    "actions" => [
      Twilio::REST::Content::V1::ContentList::CardAction.new({
        "type" => "URL",
        "title" => "Shop Now",
        "url" => "https://example.com/shop"
      }),
      Twilio::REST::Content::V1::ContentList::CardAction.new({
        "type" => "PHONE_NUMBER",
        "title" => "Call Store", 
        "phone" => "+1234567890"
      })
    ]
  })
})

card_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Product Card Template",
  "language" => "en",
  "variables" => {
    "1" => "product_name",
    "2" => "discount_percent"
  },
  "types" => card_types
})

begin
  card_content = @client.content.v1.contents.create(content_create_request: card_request)
  puts "Card content created: #{card_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating card content: #{e.message}"
end

# Example 3: List Picker Content
puts "\n3. Creating List Picker Content"
list_picker_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_list_picker" => Twilio::REST::Content::V1::ContentList::TwilioListPicker.new({
    "body" => "Please select a department:",
    "button" => "Select Department",
    "items" => [
      Twilio::REST::Content::V1::ContentList::ListItem.new({
        "id" => "sales",
        "item" => "Sales Department",
        "description" => "Questions about products and pricing"
      }),
      Twilio::REST::Content::V1::ContentList::ListItem.new({
        "id" => "support",
        "item" => "Technical Support", 
        "description" => "Help with technical issues"
      }),
      Twilio::REST::Content::V1::ContentList::ListItem.new({
        "id" => "billing",
        "item" => "Billing Department",
        "description" => "Questions about your account and billing"
      })
    ]
  })
})

list_picker_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Department Selector Template",
  "language" => "en",
  "types" => list_picker_types
})

begin
  list_picker_content = @client.content.v1.contents.create(content_create_request: list_picker_request)
  puts "List picker content created: #{list_picker_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating list picker content: #{e.message}"
end

# Example 4: Carousel Content
puts "\n4. Creating Carousel Content"
carousel_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_carousel" => Twilio::REST::Content::V1::ContentList::TwilioCarousel.new({
    "cards" => [
      Twilio::REST::Content::V1::ContentList::CarouselCard.new({
        "title" => "Product A",
        "subtitle" => "Premium Quality",
        "body" => "Our bestselling product with amazing features.",
        "media" => "https://example.com/product-a.jpg",
        "actions" => [
          Twilio::REST::Content::V1::ContentList::CarouselAction.new({
            "type" => "URL",
            "title" => "View Details",
            "url" => "https://example.com/product-a"
          })
        ]
      }),
      Twilio::REST::Content::V1::ContentList::CarouselCard.new({
        "title" => "Product B", 
        "subtitle" => "Great Value",
        "body" => "Affordable option without compromising quality.",
        "media" => "https://example.com/product-b.jpg",
        "actions" => [
          Twilio::REST::Content::V1::ContentList::CarouselAction.new({
            "type" => "URL",
            "title" => "View Details",
            "url" => "https://example.com/product-b"
          })
        ]
      })
    ]
  })
})

carousel_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Product Carousel Template",
  "language" => "en", 
  "types" => carousel_types
})

begin
  carousel_content = @client.content.v1.contents.create(content_create_request: carousel_request)
  puts "Carousel content created: #{carousel_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating carousel content: #{e.message}"
end

# Example 5: Catalog Content
puts "\n5. Creating Catalog Content"
catalog_types = Twilio::REST::Content::V1::ContentList::Types.new({
  "twilio_catalog" => Twilio::REST::Content::V1::ContentList::TwilioCatalog.new({
    "body" => "Browse our featured products:",
    "items" => [
      Twilio::REST::Content::V1::ContentList::CatalogItem.new({
        "id" => "item1",
        "section_title" => "Electronics",
        "name" => "Smartphone",
        "price" => 599.99,
        "description" => "Latest model with advanced features",
        "media_url" => "https://example.com/smartphone.jpg"
      }),
      Twilio::REST::Content::V1::ContentList::CatalogItem.new({
        "id" => "item2", 
        "section_title" => "Electronics",
        "name" => "Laptop",
        "price" => 999.99,
        "description" => "High-performance laptop for professionals",
        "media_url" => "https://example.com/laptop.jpg"
      })
    ]
  })
})

catalog_request = Twilio::REST::Content::V1::ContentList::ContentCreateRequest.new({
  "friendly_name" => "Product Catalog Template",
  "language" => "en",
  "types" => catalog_types
})

begin
  catalog_content = @client.content.v1.contents.create(content_create_request: catalog_request)
  puts "Catalog content created: #{catalog_content.sid}"
rescue Twilio::REST::TwilioError => e
  puts "Error creating catalog content: #{e.message}"
end

puts "\n=== Content V2 API Example ==="
# Example using Content V2 API for listing
begin
  v2_contents = @client.content.v2.contents.list(limit: 5)
  puts "Found #{v2_contents.length} content templates using V2 API:"
  v2_contents.each do |content|
    puts "- #{content.friendly_name} (#{content.sid})"
  end
rescue Twilio::REST::TwilioError => e
  puts "Error listing V2 content: #{e.message}"
end