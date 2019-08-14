# frozen_string_literal: true

module UsersHelper
  def gravatar_for(user, size = 280)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.id, class: 'gravatar')
  end
end
