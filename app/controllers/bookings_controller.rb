class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @accomodation = accomodation_id
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :accomodation_id)
  end

  def accomodation_id
    # Add your implementation here
  end
end
