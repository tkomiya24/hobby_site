class MusiciansController < ApplicationController
  layout 'main'

  before_action :check_login

  def search
    if params[:type] != 'any'
      @musicians = Musician.joins(:user)
                   .where('users.username LIKE ?', "%#{params[:query]}%")
                   .where(actable_type: params[:type])
                   .where.not(users: { id: session[:user_id] })
                   .includes(:user)
    else
      @musicians = Musician.joins(:user)
                   .where('users.username LIKE ?', "%#{params[:query]}%")
                   .where.not(users: { id: session[:user_id] })
                   .includes(:user)
    end
    @user = fetch_user
    @selected = params[:type]
    @query = params[:query]
    render('users/index')
  end

  def new
    @instrument = params[:instrument]
    if fetch_user.instrument?(@instrument)
      flash[:notice] = "You are already registered as a #{@instrument.downcase}!"
      flash[:class] = 'alert-danger'
      redirect_to(user_path)
    else
      @musician = musician_from_instrument(@instrument)
    end
  end

  def create
    @instrument = params[:instrument][:instrument]
    @musician = musician_from_instrument(@instrument, instrument_params(@instrument))
    @musician.user = fetch_user
    if @musician.save
      success_flash
      redirect_to(user_path)
    else
      render('new')
    end
  end

  def edit
    @musician = Musician.find(params[:id]).specific
    @instrument = @musician.specific.class.name.downcase
  end

  def update
    @instrument = Musician.find(params[:id])
    @instrument.specific.update(instrument_params(@instrument.specific.class.name.downcase))
    if @instrument.save
      success_flash
      redirect_to(user_path)
    else
      render('edit')
    end
  end

  def destroy
    Musician.destroy(params[:id])
    success_flash
    redirect_to(user_path)
  end

  private

  def musician_from_instrument(instrument, params = nil)
    case instrument.downcase
    when 'drummer'
      Drummer.new(params)
    when 'guitarist'
      Guitarist.new(params)
    when 'bassist'
      Bassist.new(params)
    when 'singer'
      Singer.new(params)
    end
  end

  def instrument_params(instrument)
    case instrument.downcase
    when 'drummer'
      drummer_params
    when 'guitarist'
      guitarist_params
    when 'bassist'
      bassist_params
    when 'singer'
      singer_params
    end
  end

  def bassist_params
    params.require(:instrument)
      .permit(:six_string, :five_string, :background_vocals, :experience, :proficiency)
  end

  def drummer_params
    params.require(:instrument).permit(:double_kick, :background_vocals, :experience, :proficiency)
  end

  def guitarist_params
    params.require(:instrument).permit(:rhythm_or_lead, :background_vocals, :experience,
                                       :proficiency)
  end

  def singer_params
    params.require(:instrument).permit(:range, :background_vocals, :experience, :proficiency)
  end
end
