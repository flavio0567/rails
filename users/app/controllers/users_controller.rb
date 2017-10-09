class UsersController < ApplicationController
  def new
    render "new.html.erb"
  end
  def index
    render json: User.all.select(:id, :first_name, :created_at, :updated_at)
  end
  def show
    render json: User.find(params[:id])
  end
  def edit
  	@user = User.find(params[:id])
    render "edit.html.erb" 
  end
  def create
    User.create(first_name: params[:first_name], last_name: params[:last_name], email_address: params[:email_address], age: params[:age])
    redirect_to "/users"
  end
  def total
    @total = User.count(:all)
    render :text => "<h1>Total number of users is #{@total} !</h1>".html_safe
  end
end
