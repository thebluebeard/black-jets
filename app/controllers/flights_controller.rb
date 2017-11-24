class FlightsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index,:show]
  def index
    if params
      @message = ""
      @flights = Flight.all
      @flights = @flights.select{|f| f.origin == params[:origin]} if params[:origin]
      @flights = @flights.select{|f| f.destination == params[:destination]} if params[:destination]
      flights_matched = @flights
      @flights = @flights.select{|f| f.departure > params[:departure].to_datetime && f.departure < params[:departure].to_datetime + 1} if !params[:departure].empty?
      # check if we have a flight available at a different time
      if flights_matched.empty? == false && @flights.empty?
        @flights = flights_matched.select{|f| f.departure > params[:departure].to_datetime - 3 && f.departure < params[:departure].to_datetime + 3} if !params[:departure].empty?
        @message = "Sorry we don't have what you wanted, but we have recommended some flights you might be interested in" unless @flights.empty?
        puts @message
      end
    else
      @flights = Flight.all
    end
  end



  def new
    @flight = Flight.new
    @jets = current_user.jets
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.user = current_user
    @flight.save
    redirect_to root_path
    # temporaritly direct to root_path
  end

  def show
    @flight = Flight.find(params[:id])
    @reviews = Review.where(flight_id: @flight.id)

    unless @flight.latitude.nil?
      @hash = Gmaps4rails.build_markers(@flight) do |flat, marker|
        marker.lat flat.latitude
        marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

end



  # I'll leave the edit function for later, right now we just assume user creates a flight and don't change
  # def edit
  # end

  # def update
  # end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
  end

  private
  def flight_params
    params.require(:flight).permit(
      :name,
      :jet_id,
      :origin,
      :destination,
      :departure,
      :arrival,
      :capacity,
      :price
    )
  end
end
