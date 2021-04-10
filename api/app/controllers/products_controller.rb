class ProductsController < ApplicationController

  #include AuthenticationConcern

  def get
    if params[:id] != nil and product = Product.find(params[:id])
      render json: product
    else
      render json: Product.all
    end
  end

  def post
    product = Product.new(products_params)

    if product.save 
      render json: { message: 'OK', product: product}
    else
      render json: { message: 'Unable to save'}
    end
  end

  def put
    product = Product.find(params[:id])

    if product.update(products_params)
      render json: { message: 'OK', product: product}
    else
      render json: { message: 'Unable to update'}
    end
  end

  def delete
    product = Product.find(params[:id])
    if product.destroy
      render json: { message: 'OK', product: product}
    else
      render json: { message: 'Unable to delete'}
    end
  end

  private 
    def products_params
      params.require(:product).permit(:code, :name, :brand, :ammount, :price, :category_id)
    end
end
