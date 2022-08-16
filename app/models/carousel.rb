# frozen_string_literal: true

class Carousel < ApplicationRecord
  has_one_attached :image

  scope :visible, -> { where(visible: true) }
end
