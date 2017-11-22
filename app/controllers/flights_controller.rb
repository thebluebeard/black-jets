class FlightsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index,:show]
  def index
    if params
      @flights = Flight.where(["origin = ? and destination = ? and departure > ? and departure < ?",
          params[:origin],
          params[:destination],
          "#{params[:departure].to_datetime}",
          "#{params[:departure].to_datetime + 1}"
        ]
      )
    else
      @flights = Flight.all
    end
  end



  def new
    @flight = Flight.new
    @jets = current_user.jets
  end

  def create
    @flight = flight.new(flight_params)
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
    params.require(:flight).permit(:name)
  end
end
