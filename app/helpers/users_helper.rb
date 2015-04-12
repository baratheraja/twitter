module UsersHelper
 def gravatar_for(user, options = '80' )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{options}"
    gravatar_url = "pic2.jpg"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
