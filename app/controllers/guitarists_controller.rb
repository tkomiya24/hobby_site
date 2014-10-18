class GuitaristsController < ApplicationController

	layout 'main'
	before_action :check_login

	def new
		
		@guitarist = Guitarist.new

	end

	def create
		
		@guitarist = Guitarist.new(guitarist_params)
		User.find(session[:user_id]).guitarist = @guitarist

		if @guitarist.save
			flash[:notice] = "Changes successful!"
			redirect_to(:controller => 'users', :action => 'show')
		else
			render('new')
		end

	end

	def edit
		
		@guitarist = User.find(session[:user_id]).guitarist

	end

	def update
		
		@guitarist = User.find(session[:user_id]).guitarist
		if @guitarist.update_attributes(guitarist_params)
			flash[:notice] = "Changes successful!"
			redirect_to(:controller => 'users', :action => 'show')
		else
			render('edit')
		end

	end	

	private

		def guitarist_params
			return params.require(:guitarist).permit(:background_vocals, :rhythm_or_lead, :experience, :proficiency)
		end

end