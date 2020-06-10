module ApplicationHelper
    # def sample_helper
    #     "<p>this is sample</p>".html_safe
    # end

    def nav_authentication_helper style = ""
         if current_user.is_a?(GuestUser)
            (link_to 'Log in', new_user_session_path, class: style) + 
            " ".html_safe +
            (link_to 'Register', new_user_registration_path, class: style) 
         else 
            (link_to 'Edit Profile', edit_user_registration_path, class: style) +
            " ".html_safe +
            (link_to 'Logout', destroy_user_session_path, class: style, method: :DELETE )
        end   
    end

    def source_helper(layout_name)
         if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p, greeting, class: "source-greeting")
         end
    end
    
    def nav_items
      [
        {
          url: root_path,
          title: 'Home'
        },
        {
          url: about_path,
          title: 'About'
        },
        {
          url: contact_path,
          title: 'Contact'
        },
        {
          url: blogs_path,
          title: 'Blog'
        },
        {
          url: portfolios_path,
          title: 'Portfolio'
        },
      ]
    end
  
    def nav_helper style, tag_type
      nav_links = ''
  
      nav_items.each do |item|
        nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
      end
  
      nav_links.html_safe
    end
  
    def active? path
      "active" if current_page? path
    end

    def alerts
      alert = (flash[:alert] || flash[:error] || flash[:notice])
      if alert
        alert_generator alert
      end
    end

    def alert_generator msg
      js add_gritter(msg, title: "Attention!", time: 5000)
    end
end
