class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include DefaultPageContent
    # def current_user
    #     super || guest_user
    # end

    # def guest_user
    #     OpenStruct.new(
    #         name: "Guest User"
    #         first_name: "Guest"
    #         last_name: "User"
    #         email: "guest@example.com"
    #     )
    # end
    before_action :set_copyright

    def set_copyright
        @copyright = HkViewTool::Renderer.copyright 'Hans Kristian', 'Learned from Jordan Hudgens'
    end
end

module HkViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.now.year} | <b>#{name} #{msg}</b?".html_safe
        end
    end
end