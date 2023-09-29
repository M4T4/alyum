# frozen_string_literal: true

module Public
  class SearchEngineController < ApplicationController
    def bibliographic
      @q = BibliographicFile.ransack(params[:q])
      @pagy, @files = pagy(@q.result(distinct: true))
      @results = @q.result.count
    end
  end
end
