module ApplicationHelper
  def error_messages_for(object)
    render(partial: 'application/error_message', locals: { object: object })
  end

  def authenticated_user?(user)
    user.id == session[:id]
  end

  def make_review_link_for(user, musician)
    link_to 'Write a review', new_musician_review_path(musician) unless authenticated_user?(user)
  end
end
