class SingersController < ApplicationController
  layout 'main'
  before_action :check_login

  def new
    @singer = Singer.new
  end

  def create
    @singer = Singer.new(singer_params)
    @singer.user = fetch_user

    if @singer.save
      flash[:notice] = 'Changes successful'
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
    @singer = fetch_user.singer
    @musical_hobby_attributes = @singer.musical_hobby
  end

  def update
    @singer = fetch_user.singer

    if @singer.update_attributes(singer_params)
      flash[:notice] = 'Changes successful'
      redirect_to(controller: 'users', action: 'show')
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    guitarist = fetch_user.singer
    guitarist.destroy
    flash[:notice] = 'Deletion successful'
    back_to_home
  end

  private

  def singer_params
    params.require(:singer).permit(:range, :background_vocals, :experience, :proficiency)
  end
end
