class ServicesReminderMailer < ApplicationMailer

  def services_for_tomorrow(services)
    # TODO Only Admin users
    @user = User.first
    @services = services
    mail(to: @user.email, subject: "Recordatorio: Servicios por atender mañana #{Date.tomorrow}")
  end

  def services_for_today(services)
    @user = User.first
    @services = services
    mail(to: @user.email, subject: "Recordatorio: Servicios por atender hoy #{Date.today}")
  end
end
