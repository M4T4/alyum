# frozen_string_literal: true

module Admin
  class RepositoriesController < BaseController
    before_action :set_repositories, only: %i[index new edit update]
    before_action :set_repository, only: %i[edit update]

    def index
    end

    def new
      @repository = Repository.new
    end

    def edit
      
    end

    def create
      @repository = Repository.new(repository_params)
			if @repository.save
				redirect_to admin_repositories_path, notice: 'Se agrego un nuevo repositorio'
			else
				render :new, status: :unprocessable_entity
			end
    end

    def update
			if @repository.update(repository_params)
				redirect_to admin_repositories_path, notice: 'Se actualizo el repositorio correctamente'
			else
				render :edit, status: :unprocessable_entity
			end
		end

    private

    def set_repositories
      @repositories = Repository.all.where(project_type: "main")
    end

    def set_repository
      @repository = Repository.find(params[:id])
    end

    def repository_params
      params.fetch(:repository).permit(:id, :title, :language,
        :date_of_creation, :description, :project_type, :image, :main_project_id)
    end

  end
end