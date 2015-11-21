class Admin::CustomersController < ApplicationController
	layout "admin"

	before_action :authenticate_user!
	before_action :admin_required

	def index
		@customers = Customer.all
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(customer_params)

		if @customer.save
			redirect_to admin_customers_path
		else
			render :new
		end
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to admin_customers_path
		else
			render :edit
		end
	end

	def show
		@customer = Customer.find(params[:id])
	end

	private
	def customer_params
		params.require(:customer).permit(:name, :email, :phone, :address, :uniform_numbers)
	end
end
