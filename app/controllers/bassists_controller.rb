class BassistsController < ApplicationController

	layout 'main'
	before_action :check_login

	def new
		@bassist = Bassist.new
	end

	def create
		
		@bassist = Bassist.new(bassist_params)
		User.find(session[:user_id]).bassist = @bassist

		if @bassist.save
			flash[:notice] = "Changes successful!"
			redirect_to(:controller => 'users', :action => 'show')
		else
			render('new')
		end

	end

	private

		def bassist_params
			return params.require(:bassist).permit(:background_vocals, :six_string, :five_string, :experience, :proficiency)
		end
end
