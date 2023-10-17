# frozen_string_literal: true

module Admin
  class LexicoFilesController < BaseController
    include ActiveStorage::SetCurrent

    def index
      @q = LexicoFile.ransack(params[:q])
      @pagy, @files = pagy(@q.result(distinct: true).order("id ASC"))
      @results = @q.result.count
    end

    def new
      @lexico_file = LexicoFile.new
      @alphabets = Alphabet.all
    end

    def create
			@lexico_file = LexicoFile.new(lexico_params)
			if @lexico_file.save
				redirect_to admin_lexico_files_path, notice: 'Se agrego un nuevo archivo léxico'
			else
				render :new, status: :unprocessable_entity
			end
		end

    private

    def lexico_params
      params.fetch(:lexico_file).permit(:id, :language, :word, :spanish_word, :english_word, 
        :author, :year_of_publication, :page, :provider, :translated, :audio, :audio_file,
        :bibliographic_file_id, :alphabet_id)
    end
  end
end
