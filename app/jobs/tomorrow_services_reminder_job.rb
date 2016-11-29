class TomorrowServicesReminderJob < ActiveJob::Base
  def self.perform(scheduler)
    services = scheduler.services_for_tomorrow
    ServicesReminderMailer.services_for_tomorrow(services).deliver_now
  end
end
