class BibliographicFilesController < ApplicationController
  before_action :set_bibliographic_file, only: %i[ show edit update destroy ]

  def index
    @bibliographic_files = BibliographicFile.all
    render json: @bibliographic_files
  end

  def show
    render json: @bibliographic_file
  end

  def new
    @bibliographic_file = BibliographicFile.new
  end

  def edit;end

  def create
    @bibliographic_file = BibliographicFile.new(bibliographic_file_params)

  end

  def update

  end

  def destroy
    @bibliographic_file.destroy
  end

  private
  
  def set_bibliographic_file
    @bibliographic_file = BibliographicFile.find(params[:id])
  end

  def bibliographic_file_params
    params.require(:bibliographic_file).permit(:id, :language_y, :language_y2, :researcher_first_name, :researcher_last_name, :gender, :year, :ms, :title, :journal_bookname, :editor_record, :volume, :volume_number, :publisher, :city_country, :isbn, :issn, :doi, :document_type, :country, :acces_link, :free_lock, :n1, :n2, :page_number, :base)
  end
end
