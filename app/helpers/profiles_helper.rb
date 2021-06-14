module ProfilesHelper
  def avatar_for(user, options = { size: 200 })
    if user.avatar.attached?
      image_tag(user.avatar, size: options[:size], alt: user.username, class: "avatar")
    else
      unknown_img = 'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255634-stock-illustration-avatar-icon-male-profile-gray.jpg'
      image_tag(unknown_img, size: options[:size], alt: user.username, class: "avatar")
    end
  end  
end
