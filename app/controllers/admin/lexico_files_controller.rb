# frozen_string_literal: true

module Admin
  class LexicoFilesController < BaseController
    include ActiveStorage::SetCurrent
    before_action :set_lexico_file, only: %i[edit update]
    before_action :set_alphabets

    def index
      @q = LexicoFile.ransack(params[:q])
      @pagy, @files = pagy(@q.result(distinct: true).order("id ASC"))
      @results = @q.result.count
    end

    def alphabet
      @alphabet = Alphabet.find(params[:alphabet_id])
    end

    def new
      @lexico_file = LexicoFile.new
    end
    
    def edit;end

    def create
			@lexico_file = LexicoFile.new(lexico_params)
			if @lexico_file.save
				redirect_to admin_lexico_files_path, notice: 'Se agrego un nuevo archivo léxico'
			else
				render :new, status: :unprocessable_entity
			end
		end

    def update
      if @lexico_file.update(lexico_params)
        notice = "La ficha léxica se ha actualizado correctamente"
        redirect_to admin_lexico_files_path, notice: notice
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def lexico_params
      params.fetch(:lexico_file).permit(:id, :language, :word, :spanish_word, :english_word, 
        :author, :year_of_publication, :page, :provider, :translated, :audio, :audio_file,
        :bibliographic_file_id, :alphabet_id)
    end
    
    def set_lexico_file
      @lexico_file = LexicoFile.find(params[:id])
    end

    def set_alphabets
      @alphabets = Alphabet.all
    end
  end
end
