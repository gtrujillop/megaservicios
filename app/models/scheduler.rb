class Scheduler
  def self.services_for_today
    @services_for_today ||= Service.planned_for_date(Date.today)
  end

  def self.services_for_tomorrow
    @services_for_today ||= Service.planned_for_date(Date.tomorrow)
  end
end
