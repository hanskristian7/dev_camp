module BlogsHelper
    def gravatar_helper user
        image_tag "https://www.gravatar.com/avatar/d3c77c7bdd1fa448aa9bea62d91f4999", width: 40
    end

    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            Coderay.scan(code, language).div
        end
    end

    def markdown(text)
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

        options = {
            fenced_cod_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true,
        }

        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end
end
