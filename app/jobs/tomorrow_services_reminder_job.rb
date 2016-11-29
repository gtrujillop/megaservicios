class TomorrowServicesReminderJob < ActiveJob::Base
  queue_as :default

  def perform
    services = Scheduler.services_for_tomorrow
    ServicesReminderMailer.services_for_tomorrow(services).deliver_now
  end
end
