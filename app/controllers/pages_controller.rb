class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: :home
  def home
    @flights = Flight.all
  end

  def dashboard
    @bookings = current_user.bookings
  end
end
