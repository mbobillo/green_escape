class AccomodationsController < ApplicationController
  def index
    @accomodations = Accomodation.all
  end
  
  def new
    @accomodation = Accomodation.new
  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end

  def create
    @accomodation = Accomodation.new(accomodation_params)
    if @accomodation.save
      redirect_to accomodations_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
  
  def accomodation_params
    params(:accomodation).permit(:title, :description, :price, :localisation, :images, :environment_tag, :capacity, :category, :user_id)
  end

  end
end

