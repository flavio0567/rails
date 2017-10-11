class NinjasController < ApplicationController

	def index
		session[:earns] ||= 0
		session[:activities] ||= []

		@earns = session[:earns]
		@activities = session[:activities]
	end

	def rpg
		earns = 0

	    timestamp = Time.now().strftime("%Y/%m/%d %I:%M %p")
	    if  params[:ninja] == 'farm'
	        earns = rand(10..20)
	    elsif params[:ninja] == 'cave'
	        earns = rand(5..10)
	    elsif  params[:ninja] == 'house'
	        earns = rand(2..5)
	    elsif  params[:ninja] == 'casino'
	        earns = rand(-50..50)
        end

        if earns > 0
	   	    session[:activities] << "Earned #{earns} golds from the #{params[:ninja]}! #{timestamp}"
        else
            session[:activities] << "Entered a casino and lost #{earns} golds... Ouch! #{timestamp}"    
    	end

        session[:earns] += earns 
	    redirect_to :root
	end

	def clear
	    session[:earns] = nil
	    session[:activities] = nil
	    redirect_to :root 
	end

end
