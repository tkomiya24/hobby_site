class MusiciansController < ApplicationController
  layout 'main'

  before_action :check_login

  def new
    @instrument = params[:instrument]
    @musician = musician_from_instrument(@instrument)
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