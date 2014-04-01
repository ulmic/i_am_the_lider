module EventsHelper
  def participants_count(count)
    "#{count} #{Russian.p(count, I18n.t('participants.participant'), I18n.t('participants.few_participants'), I18n.t('participants.many_participants'))}"
  end
end
