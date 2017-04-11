class DailysController < ApplicationController
  def index
    @services = Service.order("next_service_date ASC")
    @service = Service.joins(:appliances).joins(:brands).joins(:types).joins(:users)
  end
end
