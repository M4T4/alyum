# frozen_string_literal: true

module Admin
  class CarouselController < BaseController
		before_action :set_carousel_element, only: %i[edit update destroy]

    def index
			@carousel_elements = Carousel.all.order('position ASC')
		end

		def new
			@carousel_element = Carousel.new
		end

		def edit
			
		end

		def create
			@carousel = Carousel.new(carousel_params)
			if @carousel.save
				redirect_to admin_carousel_index_path, notice: 'Se agrego un elemento al carousel'
			else
				render :new, status: :unprocessable_entity
			end
		end

		def update
			if @carousel_element.update(carousel_params)
				redirect_to admin_carousel_index_path, notice: 'Se actualizo elemento de carousel'
			else
				render :edit, status: :unprocessable_entity
			end
		end

		private
		
		def set_carousel_element
			@carousel_element = Carousel.find(params[:id])
		end

		def carousel_params
      params.fetch(:carousel).permit(:id, :position, :visible, :image, :link)
    end

	end
end