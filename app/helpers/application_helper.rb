module ApplicationHelper

    def gravatar_for(chef, option={size:100})
        gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: chef.chefname, class: "gravatar")
    end 
end
