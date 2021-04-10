class ProductsController < ApplicationController

  def get
    if params[:id] != nil and product = Product.find(params[:id])
      render json: product
    else
      render json: Product.all
    end
  end

  def post
  end

  def put
  end

  def delete
  end

end
