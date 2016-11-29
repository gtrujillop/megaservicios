class TodayServicesReminderJob < ActiveJob::Base
  queue_as :default

  def perform
    services = Scheduler.services_for_today
    ServicesReminderMailer.services_for_today(services).deliver_now
  end
end
