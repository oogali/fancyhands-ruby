require "time"
require "addressable/uri"
require "json"

require_relative 'request'
require_relative 'echo'
require_relative 'standard'
require_relative 'message'
require_relative 'custom'
require_relative 'outgoing'
require_relative 'history'
require_relative 'incoming'
require_relative 'number'

module FancyHands
  module V1
    class Client

      attr_accessor :request
  
      def initialize(key, secret, test=false, url="https://www.fancyhands.com/api/v1/")
        @request = Request.new(key, secret, test, url)
        @_standard = @_echo = @_custom = @_message = @_outgoing = @_incoming = @_number = @_history = nil 
      end

      # Lazy load standard
      def Standard
        if !@_standard
          @_standard = Standard.new(self)
        end
        @_standard
      end

      # Lazy load echo
      def Echo
        if !@_echo
          @_echo = Echo.new(self)
        end
        @_echo
      end

      # Lazy load custom
      def Custom
        if !@_custom
          @_custom = Custom.new(self)
        end
        @_custom
      end

      # Lazy load message
      def Message
        if !@_message
          @_message = Message.new(self)
        end
        @_message
      end
    
      # Lazy load Outgoing
      def Outgoing
        if !@_outgoing
          @_outgoing = Outgoing.new(self)
        end
        @_outgoing
      end

      # Lazy load Incoming
      def Incoming
        if !@_incoming
          @_incoming = Incoming.new(self)
        end
        @_incoming
      end

      # Lazy load Number
      def Number
        if !@_number
          @_number = Number.new(self)
        end
        @_number
      end

      # Lazy load History
      def History
        if !@_history
          @_history = History.new(self)
        end
        @_history
      end

    end
  end
end

