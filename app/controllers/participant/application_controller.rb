class Participant::ApplicationController < ApplicationController
  before_filter :check_user_signed
end
