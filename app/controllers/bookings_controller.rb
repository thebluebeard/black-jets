class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
    # @booking.user_id = current_user.id
    @flight = Flight.find(params[:flight_id])
    @booking.flight = @flight
    @booking.user = current_user
    @booking.save
  end

  def destroy

  end

  def booking_params
     params.require(:booking).permit(:surname, :given_name, :id_type, :id_number, :date_of_birth, :payment_method)
  end
end
