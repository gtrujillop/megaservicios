class LandingController < ApplicationController
  skip_before_filter :authenticate_user!
  layout "landing"
  def home
  end
end
