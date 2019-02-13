class ProductsController < ApplicationController
    def index
        @products = Product.all     
    end
    def new
        @product = Product.new
    end
    def create
      @product = Product.new(product_params) 
      respond_to do |format|
        if @product.save
          format.html { redirect_to products_path, notice: 'Product was successfully created.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end


    private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:name, :description)
    end
end
