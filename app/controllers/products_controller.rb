class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
		@product = Product.find(params[:id])
		if !current_cart.items.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "已成功將商品加入購物車..."
		else
			flash[:warning] = "商品已存在購物車..."
		end
		redirect_to :back
	end			
end
