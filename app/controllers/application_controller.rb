# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  def after_sign_in_path_for(_resource)
    admin_bibliographic_files_path
  end
end
