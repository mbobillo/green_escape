class BookingsController < ApplicationController

  def index
    @bookings = Booking.current_user.all
  end

  def create
    @booking = Booking.create(bookings_params)
  end

  private
  def bookings_params
  end
end
