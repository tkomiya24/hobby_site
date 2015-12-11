class DrummersController < ApplicationController
  layout 'main'

  before_action :fetch_user
  before_action :check_login

  def new
    @drummer = Drummer.new
  end

  def create
    @drummer = Drummer.new(read_params)
    @drummer.musical_hobby.instrument = @drummer
    @drummer.user = fetch_user

    if @drummer.save
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
    @drummer = User.find(session[:user_id]).drummer
  end

  def update
    @drummer = User.find(session[:user_id]).drummer
    if @drummer.update_attributes(read_params)
      flash[:notice] = 'Changes successful!'
      redirect_to(controller: 'users', action: 'show')
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    drummer = User.find(session[:user_id]).drummer
    drummer.destroy
    flash[:notice] = 'Deletion successful'
    back_to_home
  end

  private

  def read_params
    params.require(:drummer).permit(:double_kick, musical_hobby_attributes:
    [:background_vocals, :experience, :proficiency])
  end

  def fetch_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end
end
