class Juror::ApplicationController < ApplicationController
  before_filter :authenticate_juror!
end
