require 'aruba/cucumber'

Before do
  @dirs = ["features/xml"]
  @aruba_timeout_seconds = 30
end