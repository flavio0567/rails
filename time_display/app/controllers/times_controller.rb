class TimesController < ApplicationController
  def main
    @time = Time.now.strftime("%b %d, %Y %I:%M %p") 
    render 'main.html.erb'
  end

end
