class SingersController < ApplicationController
  layout 'main'
  before_action :check_login

  def new
    @singer = Singer.new
  end

  def create
    @singer = Singer.new(singer_params)
    get_user.singer = @singer

    if @singer.save
      flash[:notice] = 'Changes successful'
      redirect_to(controller: 'users', action: 'show')
    else
      render('new')
    end
  end

  def edit
    @singer = get_user.singer
  end

  def update
    @singer = get_user.singer

    if @singer.update_attributes(singer_params)
      flash[:notice] = 'Changes successful'
      redirect_to(controller: 'users', action: 'show')
    else
      render('edit')
    end
  end

  private

  def singer_params
    params.require(:singer).permit(:background_vocals, :range, :experience, :proficiency)
  end
end
