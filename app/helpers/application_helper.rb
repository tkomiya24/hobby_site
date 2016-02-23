module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_message', locals: { object: object })
  end

  def authenticated_user?(user)
    user.id == session[:user_id]
  end

  def make_review_link_for(user, musician)
    return if authenticated_user?(user)
    authenticated_user = User.find(session[:user_id])
    if authenticated_user.reviewed_musician?(musician)
      link_to 'View your review',
              musician_review_path(musician, musician.review_from(authenticated_user))
    else
      link_to 'Write a review', new_musician_review_path(musician)
    end
  end

  def make_show_reviews_link_for(musician)
    link_to 'See the reviews', musician_reviews_path(musician)
  end

  def make_edit_musician_link(musician, options = nil)
    type = musician.specific.class.name
    case type
    when 'Drummer'
      edit_link_helper(:drummers, options)
    when 'Guitarist'
      edit_link_helper(:guitarists, options)
    when 'Bassist'
      edit_link_helper(:bassists, options)
    when 'Singer'
      edit_link_helper(:singers, options)
    end
  end

  private

  def edit_link_helper(instrument, html_options)
    link_to_helper('Edit', { controller: instrument, action: :edit }, html_options)
  end

  def link_to_helper(body, url_options, html_options)
    link_to(body, url_options, html_options)
  end
end
