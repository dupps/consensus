require 'devise'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.extend DeviseHelper, type: :controller
end
