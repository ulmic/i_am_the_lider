require 'simplecov'
ENV["RAILS_ENV"] = "test"
SimpleCov.start('rails') if ENV["COVERAGE"]

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  require 'factory_girl'
  FactoryGirl.reload

  include FactoryGirl::Syntax::Methods
end
