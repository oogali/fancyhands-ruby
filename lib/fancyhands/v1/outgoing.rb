require "time"
require "json"

module FancyHands
  class Outgoing
    def initialize(client)
      @client = client
    end

    def post(phone="", conversation={}, title="", record="", _retry="", retry_delay="", retry_limit="", call_window_start=nil, call_window_end=nil, timeout=nil, voicemail=false, opts=nil)
      opts ||= {}
      phone = opts.fetch(:phone, phone)
      conversation = opts.fetch(:conversation, conversation)
      title = opts.fetch(:title, title)
      record = opts.fetch(:record, record)
      _retry = opts.fetch(:retry, _retry)
      retry_limit = opts.fetch(:retry_limit, retry_limit)
      call_window_start = opts.fetch(:call_window_start, call_window_start)
      call_window_end = opts.fetch(:call_window_end, call_window_end)
      timeout = opts.fetch(:timeout, timeout)
      voicemail = opts.fetch(:voicemail, voicemail)

      data = {
        :phone => phone,
        :conversation => JSON.generate(conversation),
        :title => title,
        :record => record,
        :retry => _retry,
        :retry_delay => retry_delay,
        :retry_limit => retry_limit,
        :timeout => timeout,
        :voicemail => voicemail,
      }

      if call_window_start and call_window_end
        if not call_window_start.is_a?(Time) or not call_window_end.is_a?(Time)
          raise(ArgumentError, 'Call windows must be a valid Time object')
        end

        data['call_window_start'] = call_window_start.strftime("%Y-%m-%dT%H:%M:%SZ")
        data['call_window_end'] = call_window_end.strftime("%Y-%m-%dT%H:%M:%SZ")
      end

      return @client.request.post("call/outgoing", data)
    end
  
  
    def get(key="", status="", cursor="", opts={})
      opts ||= {}
      key = opts.fetch(:key, key)
      status = opts.fetch(:status, status)
      cursor = opts.fetch(:cursor, cursor)

      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @client.request.get("call/outgoing", data)
    end

  end
end
