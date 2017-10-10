class TimesController < ApplicationController
  def index
    @time = Time.now.strftime("%b %d, %Y %I:%M %p") 
    render 'main.html.erb'
  end

end
