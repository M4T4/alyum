# frozen_string_literal: true

class Researcher < ApplicationRecord
  has_one_attached :image

  belongs_to :user, optional: true
end
