class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    
  end

  def create
    product = Product.new(
                          name: params[:name],
                          description: params[:description],
                          image_url: params[:image_url],
                          price: params[:price]
                          )
    product.save
    flash[:success] = "Product Created"
    redirect_to "/products/#{product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes(
                              name: params[:name],
                              description: params[:description],
                              image_url: params[:image_url],
                              price: params[:price]
                              )
    product.save
    flash[:success] = "Product Updated"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:warning] = "Product Destroyed"
    redirect_to "/"
  end
end
