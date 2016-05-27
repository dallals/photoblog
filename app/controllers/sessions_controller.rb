class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email:params[:session][:email].downcase)
			if user && user.authenticate(params[:session][:password])
				session[:user_id] = user.id
				session[:name] = User.find(session[:user_id]).name
				@current_user = User.find(session[:user_id])
				flash[:success] = "You are logged in"
				redirect_to user_path(user)
			else
			flash.now[:danger] = "Invalid email or password"
			render :new	
		end
	end

	def destroy
		session.clear
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end 