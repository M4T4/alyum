# frozen_string_literal: true

class BibliographicFilesController < ApplicationController
  before_action :set_bibliographic_file, only: %i[show edit update destroy]
  before_action :set_bibliografic_files_values

  def index
    @q = BibliographicFile.ransack(params[:q])
    @pagy, @files = pagy(@q.result(distinct: true))
  end

  def show; end

  def new
    @bibliographic_file = BibliographicFile.new
  end

  def edit; end

  def create
    @bibliographic_file = BibliographicFile.new(bibliographic_file_params)

    if @bibliographic_file.save
      notice = 'La ficha fue creada exitosamente'
      redirect_to action: 'index', notice: notice
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bibliographic_file.update(bibliographic_file_params)
      notice = 'La ficha fue actualizada exitosamente'
      redirect_to action: 'index', notice: notice
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bibliographic_file.destroy
  end

  private

  def set_bibliographic_file
    @bibliographic_file = BibliographicFile.find(params[:id])
  end

  def set_bibliografic_files_values
    @document_types = BibliographicFile.document_types.keys
    @n1s = BibliographicFile.n1s.keys
    @n2s = BibliographicFile.n2s.keys
  end

  def bibliographic_file_params
    params.require(:bibliographic_file).permit(:id, :language_y, :language_y2, :researcher_first_name,
                                               :researcher_last_name, :gender, :year, :ms, :title, :journal_bookname, :editor_record, :volume, :volume_number, :publisher, :city_country, :isbn, :issn, :doi, :document_type, :country, :acces_link, :free_lock, :n1, :n2, :page_number, :base)
  end
end
