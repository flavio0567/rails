class DojosController < ApplicationController
	def index
		@dojos = Dojo.all
	end

	def show
		@dojo = Dojo.find(params[:id])
		@students = Dojo.find(params[:id]).students.all
	end

	def new
		@dojo = Dojo.new
	end

	def create
		@dojo = Dojo.new(dojo_params)

		if @dojo.save
			redirect_to dojos_path(@dojo), notice: "You have successfully created a Dojo!"
		else
     	    flash[:errors] = @dojo.errors.full_messages
			redirect_to dojos_new_path
		end
	end

    def edit
		@dojo = Dojo.find(params[:id])
    end

    def update
    	@dojo = Dojo.find(params[:id])
    	@dojo.branch = params[:branch]
    	@dojo.street = params[:street]
    	@dojo.city = params[:city]
    	@dojo.state = params[:state]
		if @dojo.save
			redirect_to dojos_path(@dojo), notice: "You have successfully updated a Dojo!"
		else
     	    flash[:errors] = @dojo.errors.full_messages
			redirect_to dojos_new_path
		end

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