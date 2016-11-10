class PlacesController < ApplicationController
  def index
    @places = Place.all
    # NHO: since you will not be serving HTML with this app, you can remove the respond_to block
    # and only render json, i.e:

    # respond_to do |format|
    #   format.json { render json: @places }
    # end
    render json: @places
  end

  def show
    # NHO: shouldn't this be .findy_by so it will return an object and not an array?
    @place = Place.where(zip: params[:id])
    respond_to do |format|
      format.json { render json: @place }
    end
  end

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      # NHO: nice validation checking, the only thing I might be conscious of
      # is to rendering the same type of data from the controller
      # ie. if it saves, we get back an object, but if it doesnt, we get back an array
      # this will lead to more logic on the front end
      if @place.save!
        format.json { render json: @place }
      else
        # NHO: could render the last error message so you get back just an object
        format.json { render json: @place.errors }
      end
    end
  end

  # NHO: missing update
  
  def destroy
    @place = Place.find_by(zip: params[:id])
    @place.destroy
    render json: {status: "deleted"}
  end

  private

  def place_params
    params.require(:place).permit(:name, :state, :zip, :rent)
  end
end
