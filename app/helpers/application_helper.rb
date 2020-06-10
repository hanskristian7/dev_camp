module ApplicationHelper
    # def sample_helper
    #     "<p>this is sample</p>".html_safe
    # end

    def nav_authentication_helper style
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
end
