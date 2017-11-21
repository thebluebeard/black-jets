class PagesController < ApplicationController
  def home
    @flights = Flight.all
  end
end
