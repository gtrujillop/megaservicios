class DailysController < ApplicationController
  def index
    @services = Service.order("next_service_date DESC")
  end
end
