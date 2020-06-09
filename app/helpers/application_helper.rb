module ApplicationHelper
    # def sample_helper
    #     "<p>this is sample</p>".html_safe
    # end

    def nav_authentication_helper
         if user_signed_in? 
            (link_to 'Edit Profile', edit_user_registration_path) +
            "<br>".html_safe +
            (link_to 'Logout', destroy_user_session_path, method: :DELETE )
        else 
            (link_to 'Log in', new_user_session_path) + 
            "<br>".html_safe +
            (link_to 'Register', new_user_registration_path) 
        end   
    end

    def source_helper(layout_name)
         if session[:source]
            greeting = "Thanks for visiting me from #{session[:source]}"
            content_tag(:p, greeting, class: "source-greeting")
         end
    end
end
