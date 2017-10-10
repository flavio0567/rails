class SurveyFormsController < ApplicationController
  def index
    session[:visit] ||= 0
    render "index.html.erb"
  end
  def survey_proc
    session[:visit] += 1
    flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:visit] } times now!"
    session[:user] = params[:user]
    redirect_to "/result"
  end
  def result
    @user = session[:user]
    render "result.html.erb"
  end
  def back
    # session[:visit] = nil
  	session[:user] = nil
    redirect_to "/"
  end
end
