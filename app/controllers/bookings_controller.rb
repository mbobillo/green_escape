class BookingsController < ApplicationController
  before_action :set_accommodation, only: :create
  before_action :set_booking, only: [:accept, :decline]

  def index
    @bookings = Booking.all.ordered
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

  def accept
    if @booking.update(status: 'accepted')
      redirect_to bookings_path, notice: 'Booking was successfully accepted.'
    else
      redirect_to bookings_path, alert: 'Failed to accept the booking.'
    end
  end

  def decline
    if @booking.update(status: 'declined')
      redirect_to bookings_path, notice: 'Booking was successfully declined.'
    else
      redirect_to bookings_path, alert: 'Failed to decline the booking.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to bookings_path, notice: 'Booking was successfully deleted.'
    else
      redirect_to bookings_path, alert: 'Failed to delete the booking.'
    end
  end



  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_accommodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
