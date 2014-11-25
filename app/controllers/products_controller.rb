class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
                else
                  Product.all
                end

    @products = Product.order('products.created_at DESC').page(params[:page])

    respond_to do |format|
      format.js # allows controller to respond to JavaScript
      format.html
    end
    if request.xhr?
      render 'productinfo'
    end
  end

  def show
    @product = Product.find(params[:id])
    # If the a user is logged it he should be able to review a product.
    if current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to products_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end


end
