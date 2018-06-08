class DailiesController < ApplicationController
  before_action :set_services, only: [:index]

  def index; end

  def day
    @date_services = params[:date]
    @day_services = Service.planned_for_date(@date_services)
  end

  private 
  
  def set_services
    @services = Service.order("next_service_date ASC")
    @service = Service.joins(:appliances).joins(:brands).joins(:types).joins(:users)
  end
end
