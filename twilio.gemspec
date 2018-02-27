Gem::Specification.new do |s|
  s.name    = "twilio"
  s.version = "0.0.1"
  s.authors = ["Root"]
  s.email   = ["devs@joinroot.com"]
  s.summary = "Integration with the Twilio API"

  # external gems
  s.add_dependency "twilio-ruby", "5.6.2"
  s.add_dependency "activesupport"
end
