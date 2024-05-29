class BookingsController < ApplicationController
  before_action :set_accommodation, only: :create

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.accomodation = @accomodation

    if @booking.save
      redirect_to bookings_path
    else
      render "accomodations/show", status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_accommodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end
end
