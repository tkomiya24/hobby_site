module MusiciansHelper
  def new_musician_instrument(title, instrument)
    link_to(title, controller: 'musicians', action: 'new', instrument: instrument)
  end

  def render_specific_summary(musician)
    render(partial: "#{symbol_from_musician(musician)}/summary",
           locals: { musician: musician.specific })
  end
end
