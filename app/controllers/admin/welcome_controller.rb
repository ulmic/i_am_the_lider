class Admin::WelcomeController < Admin::ApplicationController
  def index
    @events = Event.all
  end
end
