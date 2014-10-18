class UsersController < ApplicationController

  layout "main"

  before_action :check_login, :except => [:login, :new, :create, :attempt_login, :logout]

  def new
  	@user = User.new
  end

  def create
  	
  	@user = User.new(user_params)

  	if @user.save
      flash[:notice] = "User created successfully!!!"
      session[:user_id] = @user.id
      redirect_to(:action => 'show')
  	else
  		render('new')
  	end

  end

  def show
      @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Update Successful"
      redirect_to(:action => 'show')
    else
      render('edit')
    end

  end

  def login

  end

  def attempt_login

    if params[:username].present? && params[:password].present?

      user = User.where(:username => params[:username]).first
      if user
        authorized_user = user.authenticate(params[:password])
      end

    end
    if authorized_user
      session[:user_id] = user.id
      redirect_to(:action => 'show')
    else
      flash[:notice] = "Invalid username or password"
      redirect_to(:action => 'login')
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to(:action => 'login')
  end

  private

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :username, :password, :city, :email, :password_confirmation, :email_confirmation)
  	end



end
