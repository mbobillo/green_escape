class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.create(bookings_params)
  end

  private
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :accomodation_id)
  end
end
