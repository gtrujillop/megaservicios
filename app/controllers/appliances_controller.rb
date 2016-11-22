class AppliancesController < ApplicationController

  def new
    @appliance = Appliance.new
    # TODO Refactor this.
    @users = User.all unless params[:user_id]
    @users = User.where(id: params[:user_id]) if params[:user_id]
    @brands = Brand.all
    @types = Type.all
  end

  def create
    @appliance = Appliance.new(appliance_params)
    if @appliance.save
      flash[:success] = 'Nuevo electrodoméstico registrado.'
      redirect_to appliances_path
    else
      flash[:error] = @appliance.errors.full_messages.join(',')
      render 'new'
    end
  end

  def show
    @appliance = Appliance.find(params[:id])
    if @appliance.nil?
      flash[:error] = 'Appliance does not exist.'
      render 'index'
    end
  end

  def index
    @appliances = Appliance.all unless params[:user_id]
    @appliances = Appliance.where(user_id: params[:user_id]) if params[:user_id]
    @user = User.find(params[:user_id]) if params[:user_id]
    @user_id = @user.id if @user
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
