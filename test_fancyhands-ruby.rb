require_relative 'lib/fancyhands'

Fancy = FancyHands::V1::Client.new("API_KEY", "API_SECRET", true)

standard_request = Fancy.Standard.post("ruby test", "from ruby", 2.50)
puts "Created request, loading it again"
reloaded_standard_request = Fancy.Standard.get(standard_request["key"])
puts "Loaded " + reloaded_standard_request["title"] + " (" + reloaded_standard_request["uniq"]  + ")"


puts Fancy.Echo.post({ :somedata => "here's yer data" })

# create a custom request
c = Fancy.Custom.post("From ruby", "some description", 1.0, nil, {})
# reload it
puts Fancy.Custom.get(c["key"])
# load all custom requests...
puts Fancy.Custom.get()

r =  Fancy.Standard.post("A new standard request", "some description", 1.0, nil)
k = r["key"]
Fancy.Message.post(k, "A messgae on the new stnadard request")
puts Fancy.Standard.get(k)


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
              :name =>  "Trasnsfer",
              :result =>  "-- Transfer Call --"
            }
          ]
        }
      ],
      :transfer_number =>  "815-455-3440"
    }
  ]
}

r =  Fancy.Call.post("123-345-1234", conversation)
puts "Created call!"
