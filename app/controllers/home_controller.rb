# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # search = params[:term].present? ? params[:term] : nil
    # @files = if search
    #   BibliographicFile.where("language_y LIKE ? OR language_y2 LIKE ?", "%#{search}", "%#{search}")
    # else
    #   BibliographicFile.all
    # end

    @q = BibliographicFile.ransack(params[:q])
    @files = @q.result
  end
end
