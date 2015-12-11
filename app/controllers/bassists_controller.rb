class BassistsController < ApplicationController
  layout 'main'
  before_action :check_login

  def new
    @bassist = Bassist.new
  end

  def create
    @bassist = Bassist.new(bassist_params)
    @bassist.user = fetch_user
    if @bassist.save
      flash[:notice] = 'Changes successful!'
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
    @bassist = fetch_user.bassist
  end

  def update
    @bassist = fetch_user.bassist
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
      .permit(:six_string, :five_string,
              musical_hobby_attributes: [:background_vocals, :experience, :proficiency])
  end
end
