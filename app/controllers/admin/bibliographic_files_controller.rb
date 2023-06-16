# frozen_string_literal: true

module Admin
  class BibliographicFilesController < BaseController
    before_action :set_bibliographic_file, only: %i[show edit update destroy versions researchers remove_researcher add_researcher]
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

    def researchers;end

    def remove_researcher
      SecondaryAuthor.find(params[:seondary_author_id]).destroy

      notice = 'Se ha removido el autor correctamente'
      redirect_to admin_bibliographic_files_path, notice: notice
    end

    def add_researcher
      @researcher = @bibliographic_file.secondary_authors.new(
        first_name: params[:first_name],
        last_name: params[:last_name]
      )
      if @researcher.save
        notice = 'Se ha agregado al nuevo autor correctamente '
        redirect_to admin_bibliographic_files_path, notice: notice
      else
        message = @researcher.errors.full_messages
        flash[:alert] = message
        redirect_to admin_bibliographic_files_path, notice: notice
      end
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
                                                 :researcher_last_name, :gender, :year, :title, :journal_bookname, :editor_record, :volume, :volume_number, :publisher, :city_country, :isbn, :issn, :doi, :document_type, :country, :acces_link, :free_lock, :ms, :n1, :n2, :page_number, :base)
    end
  end
end
