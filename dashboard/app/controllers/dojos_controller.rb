class DojosController < ApplicationController
	def index
		@dojos = Dojo.all
	end

	def new
		@dojo = Dojo.new
	end

	def create
		dojo = Dojo.new(dojo_params)
		if dojo.save
			redirect_to dojos_path(dojo)
		else
			redirect_to dojos_new_path
		end
	end


	private
	def dojo_params
		params.require(:dojo).permit(:branch, :street, :city, :state)
	end

end