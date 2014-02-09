module Juror::EvaluationsHelper
  def there_is_eval(criterion, user, juror)
    user.evaluations & criterion.evaluations & juror.evaluations
  end
end
