require "time"

module FancyHands
  class Standard
    def initialize(client)
      @client = client
    end

    def post(title="", description="", bid=0.0, expiration_date=nil, opts={})
      opts ||= {}
      title = opts.fetch(:title, title)
      description = opts.fetch(:description, description)
      bid = opts.fetch(:bid, bid)
      expiration_date = opts.fetch(:expiration_date, expiration_date)

      if !expiration_date
        expiration_date = DateTime.now + 1
      end

      data = {
        :title => title,
        :description => description,
        :bid => bid,
        :expiration_date => expiration_date.strftime("%Y-%m-%dT%H:%M:%SZ"),
      }
      return @client.request.post("request/standard", data)
    end
  
  
    def get(key="", status="", cursor="", opts={})
      opts ||= {}
      key ||= opts[:key]
      status ||= opts[:status]
      cursor ||= opts[:cursor]

      data = {
        :key => key,
        :status => status,
        :cursor => cursor
      }
      return @client.request.get("request/standard", data)
    end
  end
end
