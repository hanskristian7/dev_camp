class ApplicationController < ActionController::Base
    include DeviseWhitelist
    include SetSource
    include DefaultPageContent
    include CurrentUserConcern
    
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