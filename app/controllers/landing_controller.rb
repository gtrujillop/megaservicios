class LandingController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "landing"
  def home
    @articles = Article.paginate(page: params[:page],per_page:3).ultimos
    @statics = Article.take(2)
    @contact = Contact.new
  end
end
