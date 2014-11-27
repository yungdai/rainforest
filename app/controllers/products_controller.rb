class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  # This line take the search text and makes it all lower case and query's the database that are equal to anything that contains that text in lowercase.
                  Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%").page(params[:page])
                else
                  # Gets everything in order by the created at date created
                  Product.order('products.created_at DESC').page(params[:page])
                end

    respond_to do |format|
      format.js # allows controller to respond to JavaScript
      format.html # allows controller to respond to HTML
    end
  end

  def show
    @product = Product.find(params[:id])
    # If the a user is logged it he should be able to review a product.
    @review = Review.new
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
