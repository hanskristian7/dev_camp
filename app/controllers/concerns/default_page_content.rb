module DefaultPageContent
    extend ActiveSupport::Concern
    included do
        before_action :set_title
        def set_title
            @page_title = "Devcamp Portfolio | My Portfolio Website"
        end
    end
end