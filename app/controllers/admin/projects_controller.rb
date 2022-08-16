# frozen_string_literal: true

module Admin
  class ProjectsController < BaseController
    before_action :set_project, only: %i[show edit update destroy]

    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def edit; end

    def show; end

    def create
      @project = Project.new(project_params)

      if @project.save
        redirect_to  admin_projects_path, notice: 'Se ha agregado el investigador'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @project.update(project_params)
        redirect_to  admin_projects_path, notice: 'Se ha actualizado el investigador exitosamente'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.fetch(:project).permit(
        :id, :body, :title, :image
      )
    end
  end
end
