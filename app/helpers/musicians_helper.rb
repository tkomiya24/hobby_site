module MusiciansHelper
  def new_musician_instrument(title, instrument)
    link_to(title, controller: 'musicians', action: 'new', instrument: instrument)
  end
end
