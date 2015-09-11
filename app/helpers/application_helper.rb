module ApplicationHelper


   renderer = Redcarpet::Render::HTML.new(
    autolink: true,
    space_after_headers: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    hard_wrap: true,
    xhtml: true,
    lax_html_blocks: true,
    strikethrough: true,
    filter_html: true
  )

  @@markdown = Redcarpet::Markdown.new(renderer)

  def markdown(text)
    @@markdown.render(text).html_safe
  end

end
