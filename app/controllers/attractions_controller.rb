class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      redirect_to edit_attraction_path
    end
  end

  private

  def attraction_params
      params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end

end
