class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_accomodation, only: :create
  before_action :set_booking, only: [:accept, :decline, :destroy]

  def index
    @incoming_bookings = Booking.joins(:accomodation).where(accomodations: { user_id: current_user.id }).where('bookings.start_date >= ?', Date.today).order(:start_date)
    @outgoing_bookings = current_user.bookings.where('start_date >= ?', Date.today).order(:start_date)
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
      session[:alert_kind] = 'decline'
      redirect_to bookings_path, notice: 'Booking was successfully declined.'
    else
      redirect_to bookings_path, alert: 'Failed to decline the booking.'
    end
  end

  def destroy
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

  def set_accomodation
    @accomodation = Accomodation.find(params[:accomodation_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
