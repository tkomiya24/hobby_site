class MusiciansController < ApplicationController
  layout 'main'

  before_action :check_login

  def new
    @instrument = params[:instrument]
    @musician = musician_from_instrument(@instrument)
  end

  def edit
    @musician = Musician.find(params[:id]).specific
    @instrument = @musician.specific.class.name.downcase
  end

  def destroy
    Musician.destroy(params[:id])
    success_flash
    redirect_to(user_path)
  end

  private

  def musician_from_instrument(instrument)
    case instrument.downcase
    when 'drummer'
      Drummer.new
    when 'guitarist'
      Guitarist.new
    when 'bassist'
      Bassist.new
    when 'singer'
      Singer.new
    end
  end
end
