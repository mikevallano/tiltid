module TilLogsHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= 'bash'
      CodeRay.scan(code, language).div
    end
  end

  def markdown_display(text)
    coderayified = CodeRayify.new(filter_html: true,
                                  hard_wrap: true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }
    markdown = Redcarpet::Markdown.new(coderayified, options)
    markdown.render(text).html_safe
  end


  def tag_links(tag_list)
    tag_list.map do |tag|
      link_to tag, til_logs_path(tag: tag)
    end.join(', ').html_safe
  end

  def index_filter_text
    search = params[:search]
    tag = params[:tag]
    if search
      "matching query '#{search}'"
    elsif tag
      "tagged with '#{tag}'"
    end
  end
end
