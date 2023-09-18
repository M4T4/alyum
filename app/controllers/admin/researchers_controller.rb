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

    def user_researcher
      @users = User.all
    end

    def create
      @researcher = if params[:researcher].nil?
                      new_user_researcher
                    else
                      Researcher.new(researcher_params)
                    end

      if @researcher.save
        redirect_to  admin_researchers_path, notice: 'Se ha agregado el investigador'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @researcher.update(researcher_params)
        redirect_to  admin_researchers_path, notice: 'Se ha actualizado el investigador exitosamente'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_researcher
      @researcher = Researcher.find(params[:id])
    end

    def researcher_params
      params.fetch(:researcher).permit(
        :id, :academic_description, :main_language, :main_language_level,
        :user_id, :image, :first_name, :last_name
      )
    end

    def new_user_researcher
      user = User.find(params[:user_id])

      Researcher.new(
        first_name: user.first_name,
        last_name: user.last_name
      )
    end
  end
end
