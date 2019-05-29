module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for
    gravatar_id = Digest::MD5::hexdigest(self.user_name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
