# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    before_action :set_bibliographic_file, only: %i[show edit update destroy]

    def index
      @users = User.all
    end
  end
end
