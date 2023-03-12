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

    def graphs
      years_a = BibliographicFile.where.not(year: [nil,"0"]).order('year ASC').group(:year).count
      years_b = BibliographicFile.where(year: [nil,"0"]).count
      @years = { "S/E" => years_b }.merge(years_a)

      language_a = BibliographicFile.where.not(language_y: [nil,"n",""]).group(:language_y).count
      language_b = BibliographicFile.where(language_y: [nil,"n", ""]).count
      @language_y = { "S/E" => language_b }.merge(language_a)

      n1_a = BibliographicFile.where.not(n1: [nil,"n", ""]).group(:n1).count
      n1_b = BibliographicFile.where(n1: [nil,"n", ""]).count
      @n1 = { "S/E" => n1_b }.merge(n1_a)
    

    end
  end
end
