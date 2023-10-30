# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[show edit edit_password update update_password destroy]
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit; end

    def edit_password
      
    end

    def show; end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to  admin_users_path, notice: 'Se ha agregado el usuario'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        redirect_to  admin_users_path, notice: 'Se ha actualizado el usuario exitosamente'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def update_password
      password = params[:user][:password]
      binding.break
      if @user.reset_password(password, password)
        redirect_to  admin_users_path, notice: 'Se ha actualizado la contraseña del usuario exitosamente'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_user
      if params[:id].nil?
        @user = User.find(params[:user_id])
      else
        @user = User.find(params[:id])
      end
    end

    def user_params
      params.fetch(:user).permit(
        :id, :role, :password, :password_confirmation,
        :email, :image, :first_name, :last_name, :website_link
      )
    end
  end
end
