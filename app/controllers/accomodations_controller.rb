class AccomodationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accomodations = Accomodation.all
    @accomodation = Accomodation.new
    if params[:localisation].present?
      @accomodations = @accomodations.where("localisation ILIKE ?", "%#{params[:localisation]}%").and(@accomodations.where("capacity >= ?", params[:capacity]))
    end
    if params[:category].present?
      @accomodations = @accomodations.where(category: params[:category])
    end
    @markers = @accomodations.geocoded.map do |a|
      {
        lat: a.latitude,
        lng: a.longitude,
        info_window_html: render_to_string(partial: "accomodations/info_window", locals: {a: a}, formats: :html)
      }
    end
    respond_to do |format|
      format.html
      format.json do
        render json: {
          list_partial: render_to_string(partial: 'accomodations/accomodation_list', locals: { accomodations: @accomodations, markers: @markers }, formats: :html)
        }
      end
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
