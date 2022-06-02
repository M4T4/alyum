# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  # def after_sign_in_path_for(resource)
  #   if current_user.admin?
  #     dashboard_path
  #   elsif current_user.intern?
  #     root_path
  #   else
  #     root_path
  #   end
  # end
  
end
