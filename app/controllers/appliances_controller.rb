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
      redirect_to user_list_path
    else
      flash[:error] = @appliance.errors.full_messages.join(',')
      render 'new'
    end
  end

  def show
    @appliance = Appliance.find(params[:id])
    if @appliance.nil?
      flash[:error] = 'Electrodoméstico no existe.'
      render 'index'
    end
  end

  def index
    @appliances = Appliance.all unless params[:user_id]
    @appliances = Appliance.where(user_id: params[:user_id]) if params[:user_id]
    @user = User.find(params[:user_id]) if params[:user_id]
    @user_id = @user.id if @user
    if @appliances.blank? && params[:user_id]
      flash[:error] = 'No existen electrodomésticos registrados para este usuario.'
    elsif @appliances.blank?
      flash[:error] = 'No existen electrodomésticos registrados aún.'
    end
  end

  def edit
    @users = User.all unless params[:user_id]
    @brands = Brand.all
    @types = Type.all
    @appliance = Appliance.find(params[:id])
    @user = User.find(params[:user_id])
  end
  
  def update
    @users = User.all unless params[:user_id]
    @brands = Brand.all
    @types = Type.all
    @appliance = Appliance.find(params[:id])

    respond_to do |format|
      if @appliance.update(appliance_params)
        format.html { redirect_to user_list_path, notice: 'Electrodoméstico editado con exito.' }
        format.json { render :show, status: :ok, location: @appliance }
      else
        format.html { render :edit }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end   
  end
  
  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    respond_to do |format|
      format.html { redirect_to :back, alert: 'Electrodoméstico borrado con exito.' }
      format.json { head :no_content }
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
