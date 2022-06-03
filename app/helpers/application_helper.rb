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
    "#{key}" if current_page? path
    # We use string interpolation "#{key}" here to access the CSS classes we are going to create.
  end
 
end
