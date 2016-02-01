class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.sort_by{|r| r.created_at}.reverse
    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
    @categories = Category.all

  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path

  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end

  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents, :category_id)
  end

end
