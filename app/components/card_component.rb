# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(name:, image_url:, description:, language:, level:)
    @name = name
    @image_url = image_url.present? ? image_url.key : 'public/about_us/volcan.jpg'
    @description = description
    @language = language
    @level = level
  end

  def alt_description
    simple_format(@description).html_safe
  end
end
