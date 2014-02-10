module RegistrationHelper
  def can_registred?
    end_time = Time.zone.parse configus.end_reg_time
    Time.current <= end_time
  end
end
