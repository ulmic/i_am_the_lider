module Juror::WelcomeHelper
  def current_juror_decorate
    if current_juror
      current_juror.decorate
    end
  end
end
