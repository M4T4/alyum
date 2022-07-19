# frozen_string_literal: true

module Admin
  class ResearchersController < BaseController
    before_action :set_researcher, only: %i[show edit update destroy]

    def index
      @researchers = Researcher.all
    end

    def new
      @researcher = Researcher.new
    end

    def edit; end

    def show; end

    def create
      @researcher = Researcher.new(researcher_params)
      if @researcher.save
        redirect_to  admin_researchers_path, notice: 'Se ha agregado el investigador'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update; end
    
    private

    def set_researcher
      @researcher = Researcher.find(params[:id])
    end

    def researcher_params
      params.fetch(:researcher).permit(
        :academic_description, :main_language, :main_language_level, 
        :contact_email, :user_id, :image, :first_name, :last_name, :website_link
      )    
    end
  end
end
