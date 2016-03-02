class DrummersController < ApplicationController
  layout 'main'

  before_action :fetch_user, except: [:new, :delete]
  before_action :check_login

  def new
    @drummer = Drummer.new
  end

  def create
    @drummer = Drummer.new(read_params)
    @drummer.user = @user
    if @drummer.save
      success_flash
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
  end

  def update
    @drummer = @user.drummer
    if @drummer.update_attributes(read_params)
      success_flash
      redirect_to(controller: 'users', action: 'show')
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    drummer = @user.drummer
    drummer.destroy
    success_flash
    back_to_home
  end

  def review
    review_with Drummer.find(params[:reviewable_id])
  end

  private

  def read_params
    params.require(:drummer).permit(:double_kick, :background_vocals, :experience, :proficiency)
  end
end
