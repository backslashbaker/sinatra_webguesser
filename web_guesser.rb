require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
    guess = params["guess"]
    message = check_guess(params["guess"])
    erb :index, :locals => {:message => message, :guess => guess}
end

def check_guess(guess)
    if guess.nil?
		return "Please pick a number"
	else
		if guess.to_i > SECRET_NUMBER + 5 
	  		return "Way Too High"
	    elsif guess.to_i < SECRET_NUMBER - 5 
	  		return "Way Too Low"
	 	elsif guess.to_i > SECRET_NUMBER 
	  		return "Too High!" 
	  	elsif guess.to_i < SECRET_NUMBER 
	  		return "Too Low!"
	    elsif  guess.to_i == SECRET_NUMBER 
	  		return "You have guessed correctly!"
	  	end 
	end

end




