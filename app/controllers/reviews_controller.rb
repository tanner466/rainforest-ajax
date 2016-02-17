class ReviewsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]

  before_action :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user = current_user
    respond_to do | format |
      if @review.save
        format.html { redirect_to products_path, notice: 'Review created successfully' }
        format.js{ @reviews = @product.reviews.sort_by{|r| r.created_at}.reverse }
      else
        format.html { render 'products/show', alert: "There was an error." }
        format.js{ @reviews = @product.reviews.sort_by{|r| r.created_at}.reverse }
      end
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
