Gem::Specification.new do |s|
  s.name        = 'fancyhands-ruby'
  s.version     = '1.0.1'
  s.date        = '2014-09-26'
  s.summary     = "Fancy Hands"
  s.description = "A ruby gem for the Fancy Hands API"
  s.authors     = ["Ted Roden"]
  s.email       = 'tedroden@fancyhands.com'
  s.files       = ["lib/fancyhands.rb",  
                   "lib/fancyhands/v1/outgoing.rb",
                   "lib/fancyhands/v1/number.rb",
                   "lib/fancyhands/v1/incoming.rb",
                   "lib/fancyhands/v1/history.rb",
                   "lib/fancyhands/v1/client.rb",
                   "lib/fancyhands/v1/custom.rb",
                   "lib/fancyhands/v1/echo.rb",
                   "lib/fancyhands/v1/message.rb",
                   "lib/fancyhands/v1/request.rb",
                   "lib/fancyhands/v1/standard.rb"
  s.homepage    = 'https://github.com/fancyhands/fancyhands-ruby'
  s.license       = 'MIT'
  s.add_runtime_dependency 'oauth'  
end

# requires oatuh, addressable
