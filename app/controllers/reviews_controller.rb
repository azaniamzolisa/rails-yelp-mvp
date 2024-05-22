class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[index new create]

  def index
    @reviews = @restaurant.reviews
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.rating = @review.rating.to_i
    # raise
    if @review.save
      redirect_to review_path(@review), status: :found
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
