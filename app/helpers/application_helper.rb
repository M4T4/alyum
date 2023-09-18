# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def device
    agent = request.user_agent
    return 'tablet' if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return 'mobile' if agent =~ /Mobile/

    'desktop'
  end

  def current?(key, path)
    key.to_s if current_page? path
    # We use string interpolation "#{key}" here to access the CSS classes we are going to create.
  end

  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks, :tables, :footnotes, :quote]
    Markdown.new(text, *options).to_html.html_safe
  end
end
