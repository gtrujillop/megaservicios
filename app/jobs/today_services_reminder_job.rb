class TodayServicesReminderJob < ActiveJob::Base
  def self.perform(scheduler)
    services = scheduler.services_for_today
    ServicesReminderMailer.services_for_today(services).deliver_now
  end
end
