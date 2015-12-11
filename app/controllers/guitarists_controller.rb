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
      redirect_to_user
    else
      render('new')
    end
  end

  def edit
    @guitarist = User.find(session[:user_id]).guitarist
    @musical_hobby_attributes = @guitarist.musical_hobby
  end

  def update
    @guitarist = User.find(session[:user_id]).guitarist
    if @guitarist.update_attributes(guitarist_params)
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
    flash[:notice] = 'Deletion successful'
    back_to_home
  end

  private

  def guitarist_params
    params.require(:guitarist)
      .permit(:rhythm_or_lead,
              musical_hobby_attributes: [:background_vocals, :experience, :proficiency])
  end
end
