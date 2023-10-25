# frozen_string_literal: true

class RepoCardComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(name:, image_url:, description:, language:, level: nil, date_creation:)
    @name = name
    @image_url = image_url.present? ? image_url.key : 'public/about_us/volcan.jpg'
    @description = description
    @language = language
    @date_creation = date_creation
    @level = level
  end

  def alt_description
    simple_format(@description).html_safe
  end
end
