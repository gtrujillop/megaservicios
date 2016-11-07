class AppliancesController < ApplicationController

  def new
    @appliance = Appliance.new
    @users = User.all
    @brand = Brand.all
    @type = Type.all
  end

  def create
    @appliance = Appliance.new(appliance_params)
    if @appliance.save
      flash[:success] = 'Nuevo electrodoméstico registrado.'
      redirect_to appliances_path
    else
      flash[:success] = @appliance.errors.full_messages.join(',')
      render 'new'
    end
  end

  def index
    @appliances = Appliance.all
    if @appliances.empty?
      flash[:alert] = 'No hay electrodomésticos registrados.'
    end
  end

  def appliance_params
    params.require(:appliance).permit(:id,
                                      :name,
                                      :user_id,
                                      :brand_id,
                                      :type_id,
                                      :model)
  end
end
