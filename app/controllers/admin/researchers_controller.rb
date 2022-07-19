# frozen_string_literal: true

module Admin
  class ResearchersController < BaseController

    def index
      @researchers = Researcher.all
    end

    def new
      @researcher = Researcher.new
    end

    def show
      @researcher = Researcher.find(params[:id])
    end

    def create
      @researcher = Researcher.new(researcher_params)
      if @researcher.save
        redirect_to  root_path(@researcher.id), notice: 'El curso ha sido creado'
      else
        render :new, status: :unprocessable_entity
      end
    end
    
    private

    def researcher_params
      params.fetch(:researcher).permit(
        :academic_description, :main_language, :main_language_level, 
        :contact_email, :user_id, :image
      )    
    end
  end
end
