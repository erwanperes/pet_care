class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  
  def index
    @pets = current_user.pets.order(:name)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)
    
    if @pet.save
      redirect_to @pet, notice: 'Animal successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Animal successfully update.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'Animal successfully deleted.'
  end
  
  private
  
  def set_pet
    @pet = current_user.pets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to pets_path, alert: 'Pet not found.'
  end
  
  def pet_params
    params.require(:pet).permit(:name, :species, :gender, :breed, :birth_day)
  end
end
