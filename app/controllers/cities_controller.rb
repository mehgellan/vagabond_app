class CitiesController < ApplicationController
  def index
    @cities = City.all
    @city = City.find_by_id(params[:id])
    render :index
  end

  def new
    @city = City.new
    render :new
  end

  def create
    @city = City.create(city_params)
    redirect_to @city
  end

  def show
    @city = City.find_by_id(params[:id])
  end

  private

  def city_params
    params.require(:city).permit(:city, :state, :country, :image)

  end

end
