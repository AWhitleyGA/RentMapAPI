class PlacesController < ApplicationController
  def index
    @places = Place.all
    respond_to do |format|
      format.json { render json: @places }
    end
  end

  def show
    @place = Place.where(zip: params[:id])
    respond_to do |format|
      format.json { render json: @place }
    end
  end

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save!
        format.json { render json: @place }
      else
        format.json { render json: @place.errors }
      end
    end
  end

  def destroy
    @place = Place.where(zip: params[:id])
    @place.destroy
  end

  private

  def place_params
    params.require(:place).permit(:name, :state, :zip, :rent)
  end
end
