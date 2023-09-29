# frozen_string_literal: true

module Public
  class SearchEngineController < ApplicationController
    def bibliographic
      @q = BibliographicFile.ransack(params[:q])
      @pagy, @files = pagy(@q.result(distinct: true))
      @results = @q.result.count
    end

    def lexico
      search_params = params[:q]
      query_base = search_params.present? ? LexicoFile.all : LexicoFile.none
      @q = query_base.ransack(search_params)
      @pagy, @files = pagy(@q.result(distinct: true))
    end
  end
end
