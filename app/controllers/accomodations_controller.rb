class AccomodationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accomodations = Accomodation.all
    @markers = @accomodations.geocoded.map do |a|
      {
        lat: a.latitude,
        lng: a.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {a: a})
      }
    end
  end

  def new
    @accomodation = Accomodation.new
  end

  def show
    @accomodation = Accomodation.find(params[:id])
    @booking = Booking.new
    @experiences = @accomodation.experiences

    return if @accomodation.geocoded?

    @markers = [

      {
        lat: @accomodation.latitude,
        lng: @accomodation.longitude
      }
    ]
  end

  def activity

  end

  def create
    @accomodation = Accomodation.new(accomodation_params)
    @accomodation.user = current_user
    if @accomodation.save
      redirect_to accomodation_path(@accomodation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def accomodation_params
    params.require(:accomodation).permit(:title, :description, :price, :localisation, :environment_tag, :capacity, :category, photos: [])
  end
end
