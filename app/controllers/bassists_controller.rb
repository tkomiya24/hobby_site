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
      success_flash
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
    fetch_user
  end

  def update
    @bassist = fetch_user.bassist
    if @bassist.update_attributes(bassist_params)
      success_flash
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
    success_flash
    back_to_home
  end

  def review
    review_with Bassist.find(params[:reviewable_id])
  end

  private

  def bassist_params
    params.require(:bassist)
      .permit(:six_string, :five_string, :background_vocals, :experience, :proficiency)
  end
end
