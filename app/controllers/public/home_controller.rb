# frozen_string_literal: true

module Public
  class HomeController < ApplicationController
    def index
      ahoy.track "Home Visit"
      @carousel_elements = Carousel.visible
    end

    def about_us; end

    def yumans; end

    def researchers
      @researchers = Researcher.all
    end

    def projects
      @projects = Project.all
    end

    def graphs; end
  end
end
