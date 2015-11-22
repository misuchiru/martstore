class Cart < ActiveRecord::Base
	has_many :cart_items, dependent: :destroy 
	has_many :items, through: :cart_items, source: :product #可以從cart_item找到product

	def add_product_to_cart(product)
		items << product
	end
end
