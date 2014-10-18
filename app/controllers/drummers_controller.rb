class DrummersController < ApplicationController

	layout "main"

	before_action :get_user
	before_action :check_login

	def new
		@drummer = Drummer.new
	end

	def create

		@drummer = Drummer.new(get_drummer_params)
		@drummer.user = @user

		if @drummer.save
			redirect_to(:controller => 'users', :action => 'show')
		else
			render('new')
		end

	end

	def edit
		
		@drummer = User.find(session[:user_id]).drummer

	end

	def update
		
		@drummer = User.find(session[:user_id]).drummer
		if @drummer.update_attributes(get_drummer_params)
			flash[:notice] = "Changes successful!"
			redirect_to(:controller => 'users', :action => 'show')
		else
			render('edit')
		end

	end

	private

		def get_drummer_params
			params.require(:drummer).permit(:background_vocals, :double_kick, :experience, :proficiency)
		end

		def get_user
			
			if session[:user_id]
				@user = User.find(session[:user_id])
			end

		end
end

=begin
	Drummer schema

    t.integer  "user_id"
    t.boolean  "background_vocals", default: false
    t.boolean  "double_kick",       default: false, null: false
    t.integer  "experience",        default: 0,     null: false
    t.integer  "rating",            default: 0
    t.string   "proficiency"
    t.datetime "created_at"
    t.datetime "updated_at"

=end