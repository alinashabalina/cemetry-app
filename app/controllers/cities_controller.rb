class CitiesController < ApplicationController

  def index
    @cities = City.all.last(7)
    if params[:title].present?
      @cities= City.all.where(title: params[:title].capitalize!)
    end
  end

end
