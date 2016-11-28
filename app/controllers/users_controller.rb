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
    @users = User.all
    if @users.empty?
      flash[:alert] = 'No hay clientes registrados.'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Nuevo cliente registrado."
      redirect_to user_list_path
    else
      flash[:error] = @user.errors.full_messages.join(',')
      render 'new'
    end
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
