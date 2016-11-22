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

  def index
    @services = Service.by_user(params[:user_id])
    @user = User.find(params[:user_id])
    if @services.empty?
      flash[:alert] = 'No hay servicios registrados para este usuario.'
    end
  end

  def show
    @service = Service.find(params[:id])
    if @service.nil?
      flash[:error] = 'Service does not exist.'
      render 'index'
    end
  end

  def service_params
    params.require(:service).permit(:id,
                                    :registered_at,
                                    :appliance_id,
                                    :cost,
                                    :comments,
                                    :next_service_date)
  end
end
