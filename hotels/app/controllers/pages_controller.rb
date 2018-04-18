class PagesController < ApplicationController

  def hotels
    @hotels = Hotel.all
  end

  def rooms
  end


end
