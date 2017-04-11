class ContactsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :revise]

  # GET /contacts
  # GET /contacts.json
  def index
    if params[:view]      
      @contacts = Contact.paginate(page: params[:page],per_page:15).revised.latest
      render 'dashb'
    else
      @contacts = Contact.in_draft.latest
      $totalrevised = @contacts.size
      render 'index'      
    end
  end
  
  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end
  
  def revise
    @contact.revise!
    redirect_to contacts_url
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Mensaje enviado con exito, en breve uno de nuestros profesionales se pondra en contacto con usted.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Solicitud destruida con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:full_name, :email, :phone, :address, :problem)
    end
end
