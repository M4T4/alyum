# frozen_string_literal: true

module Admin
  class BibliographicFilesController < BaseController
    before_action :set_bibliographic_file, only: %i[show edit update destroy versions]
    before_action :set_paper_trail_whodunnit, only: %i[create update]

    def index
      @q = BibliographicFile.ransack(params[:q])
      @pagy, @files = pagy(@q.result(distinct: true))
      @results = @q.result.count
    end

    def show; end

    def new
      @bibliographic_file = BibliographicFile.new
    end

    def edit; end

    def versions
      @bibliographic_files = @bibliographic_file.versions
    end

    def create
      @bibliographic_file = BibliographicFile.new(bibliographic_file_params)

      if @bibliographic_file.save
        notice = 'La ficha fue creada exitosamente'
        redirect_to admin_bibliographic_files_path, notice: notice
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @bibliographic_file.update(bibliographic_file_params)
        notice = 'La ficha fue actualizada exitosamente'
        redirect_to admin_bibliographic_files_path, notice: notice
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @bibliographic_file.destroy
    end

    private

    def set_bibliographic_file
      @bibliographic_file = if params[:id].nil?
        BibliographicFile.find(params[:bibliographic_file_id])
      else
        BibliographicFile.find(params[:id])
      end
    end

    def bibliographic_file_params
      params.require(:bibliographic_file).permit(:id, :language_y, :language_y2, :researcher_first_name, :document_language,
                                                 :researcher_last_name, :gender, :year, :ms, :title, :journal_bookname, :editor_record, :volume, :volume_number, :publisher, :city_country, :isbn, :issn, :doi, :document_type, :country, :acces_link, :free_lock, :n1, :n2, :page_number, :base)
    end
  end
end
