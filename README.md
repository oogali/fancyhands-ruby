# fancyhands-ruby

This is our first pass at a ruby library / SDK.

We'd gladly accept any pull requests or advice.

This includes code for all of the Fancy Hands endpoints including:
 - fancyhands.call.Outgoing
 - fancyhands.call.Incoming
 - fancyhands.call.Number
 - fancyhands.call.History
 - fancyhands.echo.Echo
 - fancyhands.echo.Echo 
 - fancyhands.standard.Standard 
 - fancyhands.standard.Message
 - fancyhands.custom.Custom


# Installing it

`gem install fancyhands-ruby`

# Using it

```ruby
require 'fancyhands'
Fancy = FancyHands::V1::Client.new("YOUR API KEY", "YOUR API SECRET")
# creating and loading a standard request
s = Fancy.Standard.post("A simple request from Ruby", "Yada yada", 3.0)
puts "Created request, loading it again"
puts Fancy.Standard.get(s["key"])
conversation = {
  :id => "sample_conversation",
  :data =>  nil,
  :name =>  "Sample Conversation",
  :version =>  1.1,
  :scripts =>  [
    {
      :id =>  "start",
      :steps =>  [
        {
          :name =>  "time",
          :prompt =>  "What time is it?",
          :note =>  "The recording will tell you a time. What time is it?",
          :type =>  "text",
          :options =>  []
        },
        {
          :name =>  "transfer",
          :type =>  "logic_control",
          :note =>  "",
          :prompt =>  "OK, transferring you now.",
          :options =>  [
            {
              :name =>  "Transfer",
              :result =>  "-- Transfer Call --"
            }
          ]
        }
      ],
      :transfer_number =>  "815-555-1212"
    }
  ]
}

r =  Fancy.Call.post("815-455-3440", conversation)
puts "Created call!"
```
