class DojosController < ApplicationController
	def index
		@dojos = Dojo.all
	end

	def show
		@dojo = Dojo.find(params[:id])
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

    def edit
		@dojo = Dojo.find(params[:id])
    end

    def update
    	dojo = Dojo.find(params[:id])
    	dojo.branch = params[:branch]
    	dojo.street = params[:street]
    	dojo.city = params[:city]
    	dojo.state = params[:state]
		dojo.save
		redirect_to dojos_path
    end

    def destroy
    	dojo = Dojo.find(params[:id])
    	dojo.destroy
		redirect_to dojos_path
	end

	private
	def dojo_params
		params.require(:dojo).permit(:branch, :street, :city, :state)
	end

end