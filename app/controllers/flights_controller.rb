class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:search])
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
