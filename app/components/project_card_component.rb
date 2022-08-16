# frozen_string_literal: true

class ProjectCardComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(title:, body:, image_url:)
    @title = title
    @image = image_url
    @body = body
  end

  def alt_description
    simple_format(@description).html_safe
  end
end
