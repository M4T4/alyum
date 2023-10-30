# frozen_string_literal: true

module Admin
  class LanguagesController < BaseController
    before_action :set_language, only: %i[edit update]

    def index
      @languages = Language.all
    end

    def new
      @language = Language.new
    end

    def edit; end

    def create
			@language = Language.new(language_params)
			if @language.save
				redirect_to admin_languages_path, notice: 'Se agrego un nuevo lenguaje'
			else
				render :new, status: :unprocessable_entity
			end
		end

		def update
			if @language.update(language_params)
				redirect_to admin_languages_path, notice: 'Se actualizo el lenguaje correctamente'
			else
				render :edit, status: :unprocessable_entity
			end
		end

		private

    def set_language
			@language = Language.find(params[:id])
		end

		def language_params
      params.fetch(:language).permit(:id, :name)
    end

  end
end
