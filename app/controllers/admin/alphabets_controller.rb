# frozen_string_literal: true

module Admin
  class AlphabetsController < BaseController
    before_action :set_alphabet, only: %i[edit update]

    def index
      @alphabets = Alphabet.all
    end

    def new
      @alphabet = Alphabet.new
    end

    def edit; end

    def create
			@alphabet = Alphabet.new(alphabet_params)
			if @alphabet.save
				redirect_to admin_alphabets_path, notice: 'Se agrego un nuevo alfabeto'
			else
				render :new, status: :unprocessable_entity
			end
		end

		def update
			if @alphabet.update(alphabet_params)
				redirect_to admin_alphabets_path, notice: 'Se actualizo el alfabeto correctamente'
			else
				render :edit, status: :unprocessable_entity
			end
		end

		private

    def set_alphabet
			@alphabet = Alphabet.find(params[:id])
		end

		def alphabet_params
      params.fetch(:alphabet).permit(:id, :name, :image)
    end

  end
end
