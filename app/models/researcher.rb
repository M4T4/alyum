# frozen_string_literal: true

class Researcher < ApplicationRecord
	belongs_to :user, optional: true
end
