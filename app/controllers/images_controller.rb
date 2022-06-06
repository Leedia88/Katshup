class ImagesController < ApplicationController

    def create
          @product = Product.find(params[:product_id])
          @product.image.attach(params[:image])
          redirect_to(root_path)
    end
end
