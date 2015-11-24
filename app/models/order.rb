class Order < ActiveRecord::Base
	belongs_to :user

	has_many :items, clsss_name: "OrderItem", dependent: :destroy
	has_one :info, clsss_name: "OrderInfo", dependent: :destroy
end
