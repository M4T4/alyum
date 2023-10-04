# frozen_string_literal: true

module Admin
  class LexicoFilesController < BaseController
    def index
      @q = LexicoFile.ransack(params[:q])
      @pagy, @files = pagy(@q.result(distinct: true).order("id ASC"))
      @results = @q.result.count
    end

    def new
      @lexico_file = LexicoFile.new
    end

  end
end
