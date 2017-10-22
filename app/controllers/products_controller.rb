# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.user_id = 1
    if product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])

    if product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private def product_params
    params.require(:product).permit(:name, :owner, :starting_price)
  end
end
