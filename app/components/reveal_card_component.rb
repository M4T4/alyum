# frozen_string_literal: true

class RevealCardComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(name:, description:, language:, main_project:, date_creation:)
    @name = name
    @description = description
    @language = language
    @main_project = main_project
    @date_creation = date_creation
  end

  def alt_description
    simple_format(@description).html_safe
  end
end
