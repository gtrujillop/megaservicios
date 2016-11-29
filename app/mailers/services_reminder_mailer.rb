class ServicesReminderMailer < ApplicationMailer

	def services_for_tomorrow(services)
		@user = current_user
    @services = services
		mail(to: @user.email, subject: "Recordatorio: Servicios por atender mañana #{Date.tomorrow}")
	end

  def services_for_today(services)
    @user = current_user
    @services = services
		mail(to: @user.email, subject: "Recordatorio: Servicios por atender hoy #{Date.today}")
	end
end
