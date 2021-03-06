module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_message', locals: { object: object })
  end

  def authenticated_user?(user)
    user.id == session[:user_id]
  end

  def make_edit_musician_link(musician, options = nil)
    edit_link_helper(symbol_from_musician(musician), options)
  end

  def render_specific_data(musician)
    render(partial: "#{symbol_from_musician(musician)}/show",
           locals: { specific: musician.specific })
  end

  private

  def symbol_from_musician(musician)
    type = musician.specific.class.name
    case type
    when 'Drummer'
      :drummers
    when 'Guitarist'
      :guitarists
    when 'Bassist'
      :bassists
    when 'Singer'
      :singers
    end
  end

  def edit_link_helper(instrument, html_options)
    link_to_helper('Edit', { controller: instrument, action: :edit }, html_options)
  end

  def link_to_helper(body, url_options, html_options)
    link_to(body, url_options, html_options)
  end
end
