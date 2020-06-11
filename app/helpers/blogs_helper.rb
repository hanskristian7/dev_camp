module BlogsHelper
    def gravatar_helper user
        image_tag "https://www.gravatar.com/avatar/d3c77c7bdd1fa448aa9bea62d91f4999", width: 40
    end
end
