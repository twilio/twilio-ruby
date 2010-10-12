=begin
Copyright (c) 2009 Twilio, Inc.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
=end

# @author Twilio
module Twilio
  require 'net/http'
  require 'net/https'
  require 'uri'
  require 'cgi'
  require 'rubygems'
  require 'builder'
  require 'openssl'
  require 'base64'
    
  TWILIO_API_URL = 'https://api.twilio.com'
  
  # Twilio REST Helpers
  class RestAccount
      
    #initialize a twilio account object
    #
    #@param [String, String] Your Twilio Acount SID/ID and Auth Token
    #@return [Object] Twilio account object
    def initialize(id, token)
      @id = id
      @token = token
    end
    
    #sends a request and gets a response from the Twilio REST API
    #
    #@param [String, String, Hash] 
    #path, the URL (relative to the endpoint URL, after the /v1
    #method, the HTTP method to use, defaults to POST
    #vars, for POST or PUT, a dict of data to send
    #
    #@return Twilio response XML
    #@raises [ArgumentError] Invalid path parameter
    #@raises [NotImplementedError] Method given is not implemented
    def request(path, method=nil, vars={})
      if !path || path.length < 1
          raise ArgumentError, 'Invalid path parameter'
        end
        if method && !['GET', 'POST', 'DELETE', 'PUT'].include?(method)
          raise NotImplementedError, 'HTTP %s not implemented' % method
        end
    
        if path[0, 1] == '/'
          uri = TWILIO_API_URL + path
        else
          uri = TWILIO_API_URL + '/' + path
      end
        
      return fetch(uri, vars, method)
    end
    
    #enocde the parameters into a URL friendly string
    #
    #@param [Hash] URL key / values        
    #@return [String] Encoded URL
    protected
    def urlencode(params)
      params.to_a.collect! \
        { |k, v| "#{k}=#{CGI.escape(v.to_s)}" }.join("&")
    end
    
    # Create the uri for the REST call
    #
    #@param [String, Hash] Base URL and URL parameters        
    #@return [String] URI for the REST call
    def build_get_uri(uri, params)
      if params && params.length > 0
        if uri.include?('?')
          if uri[-1, 1] != '&'
            uri += '&'
          end
            uri += urlencode(params)
          else
            uri += '?' + urlencode(params)
        end
      end
      return uri
    end
    
    # Returns a http request for the given url and parameters
    #
    #@param [String, Hash, String] Base URL, URL parameters, optional METHOD        
    #@return [String] URI for the REST call
    def fetch(url, params, method=nil)
      if method && method == 'GET'
        url = build_get_uri(url, params)
      end
      uri = URI.parse(url)
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      if method && method == 'GET'
        req = Net::HTTP::Get.new(uri.request_uri)
      elsif method && method == 'DELETE'
        req = Net::HTTP::Delete.new(uri.request_uri)
      elsif method && method == 'PUT'
        req = Net::HTTP::Put.new(uri.request_uri)
        req.set_form_data(params)
      else
        req = Net::HTTP::Post.new(uri.request_uri)
        req.set_form_data(params)
      end
      req.basic_auth(@id, @token)
      
      return http.request(req)
    end
  end
  
  # Twiml Response Helpers
  module Verb
    module ClassMethods
      @attributes = []
      @allowed_verbs = []
      attr_accessor :attributes

      def allowed_verbs(*verbs)
        return @allowed_verbs if verbs == []
        @allowed_verbs = [] if @allowed_verbs.nil?
        verbs.each do |verb|
          @allowed_verbs << verb.to_s.capitalize
        end
        @allowed_verbs = @allowed_verbs.uniq
      end

      def attributes(*attrs)
        return @attributes if attrs == []
        @attributes = [] if @attributes.nil?
        @attributes = (@attributes + attrs).uniq
        attr_accessor(*@attributes)
        @attributes
      end
    end

    def attributes
      self.class.attributes
    end

    #test if a given verb is allowed to be nested
      #
      #@param [Object] Verb to be appended
      #@return [true, false]
    def allowed?(verb)
      self.class.allowed_verbs.nil? ? false : self.class.allowed_verbs.include?(verb.class.name.split('::')[1])
    end
       
    #initialize a twilio response object
      #
      #@param [String, Hash] Body of the verb, and a hash of the attributes
      #@return [Object] Twilio Verb object
      #
      #@raises [ArgumentError] Invalid Argument
    def initialize(body = nil, params = {})
      @children = []
      if body.class == String
        @body = body
      else
        @body = nil
        params = body || {}
      end
      params.each do |k,v|
        if !self.class.attributes.nil? && self.class.attributes.include?(k)
          send(k.to_s+"=",v)
        else
          raise ArgumentError, "Attribute Not Supported"
        end
      end
    end

    #set an attribute key / value
      #no error checking 
      #
      #@param [Hash] Hash of options
      #@return void      
    def set(params = {})
      params.each do |k,v|
        self.class.attributes k.to_s
        send(k.to_s+"=",v)
      end     
    end

    #output valid Twilio markup
      #
      #@param [Hash] Hash of options
      #@return [String] Twilio Markup (in XML)  
    def respond(opts = {})
      opts[:builder]  ||= Builder::XmlMarkup.new(:indent => opts[:indent])
      b = opts[:builder]
      attrs = {}
      attributes.each {|a| attrs[a] = send(a) unless send(a).nil? } unless attributes.nil?

      if @children and @body.nil?
        b.__send__(self.class.to_s.split(/::/)[-1], attrs) do
          @children.each {|e|e.respond( opts.merge(:skip_instruct => true) )}
        end
      elsif @body and @children == []
        b.__send__(self.class.to_s.split(/::/)[-1], @body, attrs)
      else
        raise ArgumentError, "Cannot have children and a body at the same time"
      end
    end
    
    #output valid Twilio markup encoded for inclusion in a URL
      #
      #@param []
      #@return [String] URL encoded Twilio Markup (XML)
    def asURL()
      CGI::escape(self.respond)
    end
    
    def append(verb)
      if(allowed?(verb))
        @children << verb
        @children[-1]
      else
        raise ArgumentError, "Verb Not Supported"
      end    
    end
    
    # Verb Convenience Methods
    def addSay(string_to_say = nil, opts = {})
      append Twilio::Say.new(string_to_say, opts)
    end

    def addPlay(file_to_play = nil, opts = {})
      append Twilio::Play.new(file_to_play, opts)
    end

    def addGather(opts = {})
      append Twilio::Gather.new(opts)
    end

    def addRecord(opts = {})
      append Twilio::Record.new(opts)
    end

    def addDial(number = nil, opts = {})
      append Twilio::Dial.new(number, opts)
    end

    def addRedirect(url = nil, opts = {})
      append Twilio::Redirect.new(url, opts)
    end

    def addPause(opts = {})
      append Twilio::Pause.new(opts)
    end

    def addHangup
      append Twilio::Hangup.new 
    end

    def addNumber(number, opts = {})
      append Twilio::Number.new(number, opts)
    end
    
    def addConference(room, opts = {})
      append Twilio::Conference.new(room, opts)
    end
    
    def addSms(msg, opts = {})
      append Twilio::Sms.new(msg, opts)
    end

  end

  class Say
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :voice, :language, :loop
  end

  class Play
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :loop
  end

  class Gather
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :action, :method, :timeout, :finishOnKey, :numDigits
    allowed_verbs :play, :say, :pause
  end

  class Record
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :action, :method, :timeout, :finishOnKey, :maxLength, :transcribe, :transcribeCallback, :playBeep
  end

  class Dial
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :action, :method, :timeout, :hangupOnStar, :timeLimit, :callerId
    allowed_verbs :number, :conference
  end

  class Redirect
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :method
  end

  class Pause
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :length
  end

  class Hangup
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
  end

  class Number
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :sendDigits, :url
  end
  
  class Conference
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :muted, :beep, :startConferenceOnEnter, :endConferenceOnExit, :waitUrl, :waitMethod
  end
  
  class Sms
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    attributes :to, :from, :statusCallback, :action, :method
  end

  class Response
    extend Twilio::Verb::ClassMethods
    include Twilio::Verb
    allowed_verbs :say, :play, :gather, :record, :dial, :redirect, :pause, :hangup, :sms
  end
  
  # Twilio Utility function and Request Validation class
  class Utils

    #initialize a twilio utils abject
    #
    #@param [String, String] Your Twilio Acount SID/ID and Auth Token
    #@return [Object] Twilio account object
    def initialize(id, token)
      @id = id
      @token = token
    end
  
    def validateRequest(signature, url, params = {})  
      sorted_post_params = params.sort
      data = url
      sorted_post_params.each do |pkey|
        data = data + pkey[0]+pkey[1]
      end
      digest = OpenSSL::Digest::Digest.new('sha1')
      expected = Base64.encode64(OpenSSL::HMAC.digest(digest, @token, data)).strip
      return expected == signature
    end
  end
  
end
