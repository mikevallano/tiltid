module TilLogsHelper
  def tag_links(tag_list)
    tag_list.map do |tag|
      link_to tag, til_logs_path(tag: tag)
    end.join(', ').html_safe
  end
end
