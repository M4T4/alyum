# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(name:, image_url:, description:, language:, level:, email:, website_link:)
    @name = name
    @image_url = image_url.present? ? image_url : "public/about_us/volcan.jpg"
    @description = description
    @language = language
    @level = level
    @email = email
    @website_link = website_link
  end

  def alt_description
    (simple_format (@description)).html_safe
  end
end
