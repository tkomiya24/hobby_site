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
      flash[:notice] = 'Changes successful!'
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
    @bassist = User.find(session[:user_id]).bassist
  end

  def update
    @bassist = User.find(session[:user_id]).bassist
    if @bassist.update_attributes(bassist_params)
      flash[:notice] = 'Changes successful!'
      redirect_to(controller: 'users', action: 'show')
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    bassist = User.find(session[:user_id]).bassist
    bassist.destroy
    flash[:notice] = 'Deletion successful'
    back_to_home
  end

  private

  def bassist_params
    params.require(:bassist)
      .permit(:background_vocals, :six_string, :five_string, :experience, :proficiency)
  end
end
