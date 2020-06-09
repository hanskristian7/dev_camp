module SetSource
    extend ActiveSupport::Concern
    included do
        def set_source
            session[:source] = params[:q] if params[:q]
        end
    end
end