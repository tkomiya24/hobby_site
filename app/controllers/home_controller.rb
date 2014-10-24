class HomeController < ApplicationController

	layout 'main'

	before_action :check_login
	before_action :get_user

	def index
			
	end
end
