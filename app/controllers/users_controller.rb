class UsersController < ApplicationController
  def show
    @user = current_user
    @chart_presenter = ChartPresenter
  end

  def user_details
    @user = User.where(id: params[:user_id])
                .includes(:appliances)
                .first

  end

  def new
    @user = User.new
  end

  def index
    @users = User.latest
    if params[:search]
       @users = User.search(params[:search])
    else
      @users = User.latest
    end
  end  

  def update
  end
  
  def create
    unless params[:user][:id].blank? 
      @user = User.find(params[:user][:id])
      unless @user.blank?
        User.destroy(params[:user][:id])
      end
    end
    @user = User.new(user_params)
    if @user.save(validate: false)
      flash[:success] = "Registrado correctamente."
      redirect_to user_list_path
    else
      flash[:error] = @user.errors.full_messages.join(',')
      render 'new'
    end
  end
  
  def edit_user_details
    @user = User.find(params[:id])
  end
    
  def user_params
    params.require(:user).permit(:id,
                                 :first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :birth_date,
                                 :address,
                                 :phone)
  end
  private :user_params
end
