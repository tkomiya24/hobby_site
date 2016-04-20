class UsersController < ApplicationController
  layout 'main'

  before_action :check_login, except: [:login, :new, :create, :attempt_login, :logout]
  before_action :fetch_user, except: [:login, :new, :create, :attempt_login, :logout]

  # CRUD actions
  def index
    @musicians = []
    Musician.all.limit(10).find_each do |musician|
      @musicians.push(musician) unless musician.user == @user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created successfully!!!'
      session[:user_id] = @user.id
      redirect_to(action: 'show')
    else
      render('new')
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      success_flash
      redirect_to(user_path)
    else
      render(action: 'edit')
    end
  end

  def delete
  end

  def destroy
    @user.destroy
    flash[:notice] = "User '" + @user.username + "' successfully deleted"
    redirect_to(action: 'login')
  end

  # adding hobbies
  def add_instrument
  end

  # authentication
  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      user = User.where(username: params[:username]).first
      authorized_user = user.authenticate(params[:password]) if user
    end
    if authorized_user
      session[:user_id] = user.id
      redirect_to(users_path)
    else
      flash[:notice] = 'Invalid username or password'
      redirect_to(action: 'login')
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to(action: 'login')
  end

  def search
    query = "%#{params[:query]}%"
    users = User.where('first_name LIKE :query OR last_name LIKE :query OR username LIKE :query',
                       query: query)
    respond_to do |format|
      format.json do
        render json: users
      end
    end
  end

  def change_password
  end

  # private methods

  private

  def user_params
    params.require(:user)
      .permit(:first_name, :last_name,
              :username, :password, :city, :password_confirmation)
  end
end
