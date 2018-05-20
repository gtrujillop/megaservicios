class ServicesController < ApplicationController

  def new
    @service = Service.new
    @user = User.find(params[:user_id])
    @appliances = @user.appliances
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = 'Nuevo servicio registrado.'
      redirect_to user_services_path
    else
      flash[:error] = @service.errors.full_messages.join(',')
      render 'new'
    end
  end

  def complete
    @service = Service.find(params[:id])
    @service.complete!
    redirect_to :back
  end

  def uncomplete
    @service = Service.find(params[:id])
    @service.uncomplete!
    redirect_to :back
  end  
  
  def index
    @services = Service.by_user(params[:user_id])
    @user = User.find(params[:user_id])
    if @services.blank? && params[:user_id]
      flash[:error] = 'No existen servicios registrados para este usuario.'
    elsif @services.blank?
      flash[:error] = 'No existen servicios registrados aún.'
    end
  end

  def show
    @service = Service.find(params[:id])
    if @service.nil?
      flash[:error] = 'No existe el servicio.'
      render 'index'
    end
  end

  def service_params
    params.require(:service).permit(:id,
                                    :state,
                                    :registered_at,
                                    :appliance_id,
                                    :cost,
                                    :comments,
                                    :next_service_date)
  end
end
