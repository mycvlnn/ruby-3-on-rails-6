module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    email = user.email.downcase 
    gravatar_id = Digest::MD5.hexdigest(email)
    gravatar_url = "https://gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'rounded')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def logged_in?
    !!current_user
  end
end
