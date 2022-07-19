# frozen_string_literal: true

module Admin
  class ResearchersController < BaseController

    def index
      @researchers = Researcher.all
    end
  end
end
