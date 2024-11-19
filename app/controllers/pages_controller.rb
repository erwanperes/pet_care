class PagesController < ApplicationController
  def home
    @pets = Pet.all.includes(:user).order(:name)
  end
  
  def dashboard
  end
  
  def about
  end
end
