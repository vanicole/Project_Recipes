class ReviewsController < ApplicationController
  
  before_action :authenticate_user!

  def user_reviews
    @user = User.find(params[:id])
  end
  
  def new
  end

  def create
    authorize! :create, Review, :message => "You are not authorized"
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.create(review_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    authorize! :destroy, Review, :message => "You are not authorized"
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = "#{@review.user.email}'s Review deleted"
    redirect_to recipe_path(@recipe)
  end

  private
  def review_params
    p = params.require(:review).permit(:comment, :vote, :user)
    {:comment=> p[:comment], :vote=>p[:vote], :user=>current_user}
  end



end

