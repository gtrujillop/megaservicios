class TechniciansController < ApplicationController
  before_action :set_technician, only: %i[edit update show destroy]

  def index
    @technicians = Technician.latest
    puts @technicians.count
    if params[:search]
      @technicians = Technician.search(params[:search])
    else
      @technicians = Technician.latest
    end
  end

  def new
    @technician = Technician.new
  end

  def create
    @technician = Technician.new(technician_params)

    if @technician.save
      flash[:success] = 'Técnico agregado con éxito'
      redirect_to technicians_path
    else
      flash[:error] = 'No fue posible agregar al Técnico'
      render 'new'
    end
  end

  def destroy
    @technician.destroy ? flash[:success] = 'El técnico fue eliminado.' : flash[:error] = 'No es posible borrar los datos del técnico.'
    redirect_to technicians_path
  end

  def edit; end

  def show; end

  def update
    if @technician.update_attributes(technician_params)
      flash[:success] = 'Datos del técnico actualizados'
      redirect_to technicians_path
    else
      flash[:error] = 'Error al actualizar los datos del técnico'
      render 'edit'
    end
  end

  private

  def set_technician
    @technician = Technician.find(params[:id])
  end

  def technician_params
    params.require(:technician).permit(:id,
                                      :first_name,
                                      :last_name,
                                      :email,
                                      :phone)
  end
  
end