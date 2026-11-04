# Validating webhook signatures (HMAC-SHA1 and HMAC-SHA256)

By default Twilio signs webhooks with your Auth Token using HMAC-SHA1. If a
[Webhooks Rule](https://www.twilio.com/docs/usage/webhooks/webhook-rules) matches the webhook URL, Twilio signs
with the Setting's SharedKey and algorithm instead, and adds this header:

```
X-Twilio-Webhooks-Signature-Settings: key=<sharedKeyId>,algorithm=HMAC_SHA256
```

Only the hash changes. The signed string is still the full URL followed by the sorted POST parameters.

## Option 1: Rack middleware

`Rack::TwilioWebhookAuthentication` reads the header for you. Pass the SharedKey secret next to the Auth Token:

```ruby
require 'rack'

use Rack::TwilioWebhookAuthentication, ENV['AUTH_TOKEN'], /\/voice/,
    shared_key_secret: ENV['SHARED_KEY_SECRET']
```

- Header absent: validates with the Auth Token and HMAC-SHA1.
- Header present: validates with `shared_key_secret` and the header's algorithm.
- Invalid signature or unsupported algorithm: responds 403.
- Header present but `shared_key_secret` not set: responds 500.

## Option 2: Validate manually

```ruby
validator_class = Twilio::Security::RequestValidator

signature = request.env['HTTP_X_TWILIO_SIGNATURE']
settings  = request.env['HTTP_X_TWILIO_WEBHOOKS_SIGNATURE_SETTINGS']

# No header means the Auth Token and HMAC_SHA1
secret    = settings ? shared_key_secret : auth_token
algorithm = validator_class.signature_algorithm(settings)

validator = validator_class.new(secret)

# Form-encoded body
valid = validator.validate(url, params, signature, algorithm)

# JSON body (the URL carries bodySHA256)
valid_json = validator.validate(url, raw_body, signature, algorithm)
```

If you use more than one SharedKey, look up the secret by the `key=` value in the header.

Twilio signs empty parameters too, so keep them when you parse the form body (for example `URI.decode_www_form`).

## Existing code

The `algorithm` argument is optional and defaults to HMAC-SHA1, so code that validates with the Auth Token needs no change:

```ruby
Twilio::Security::RequestValidator.new(auth_token).validate(url, params, signature)
use Rack::TwilioWebhookAuthentication, ENV['AUTH_TOKEN'], /\/voice/
```
