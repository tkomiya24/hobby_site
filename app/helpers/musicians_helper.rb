module MusiciansHelper
  def new_musician_instrument(title, instrument)
    link_to(title, controller: 'musicians', action: 'new', instrument: instrument)
  end

  def render_specific_summary(musician)
    render(partial: "#{symbol_from_musician(musician)}/summary",
           locals: { musician: musician.specific })
  end

  def make_review_link_for(user, musician, options)
    return if authenticated_user?(user)
    authenticated_user = User.find(session[:user_id])
    if authenticated_user.reviewed_musician?(musician)
      link_to('View your review',
              musician_review_path(musician, musician.review_from(authenticated_user)),
              options)
    else
      link_to('Write a review', new_musician_review_path(musician), options)
    end
  end

  def musician_type_options
    options = []
    Musician.types.each do |type|
      options.push([type.pluralize.capitalize, type])
    end
    options.push(['-- Any --', 'any'])
  end
end
