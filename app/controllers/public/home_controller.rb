# frozen_string_literal: true

module Public
  class HomeController < ApplicationController
    def index; end

    def about_us; end

    def yumans; end

    def researchers
      @researchers = Researcher.all
    end

    def projects; end

    def graphs; end
  end
end
