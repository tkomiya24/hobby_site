class GuitaristsController < ApplicationController
  layout 'main'
  before_action :check_login

  def new
    @guitarist = Guitarist.new
  end

  def create
    @guitarist = Guitarist.new(guitarist_params)
    @guitarist.user = fetch_user
    if @guitarist.save
      success_flash
      redirect_to_user
    else
      render('new')
    end
  end

  def edit
    @guitarist = User.find(session[:user_id]).guitarist
  end

  def update
    @guitarist = User.find(session[:user_id]).guitarist
    @guitarist.update(guitarist_params)
    if @guitarist.save
      redirect_to_user
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    guitarist = User.find(session[:user_id]).guitarist
    guitarist.destroy
    success_flash
    back_to_home
  end

  def review
    review_with Guitarist.find(params[:reviewable_id])
  end

  private

  def guitarist_params
    params.require(:guitarist).permit(:rhythm_or_lead, :background_vocals, :experience,
                                      :proficiency)
  end
end
