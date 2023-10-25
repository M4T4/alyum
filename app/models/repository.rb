# frozen_string_literal: true

class Repository < ApplicationRecord
  has_one_attached :image
  enum project_type: [ :main, :secondary ]


  # Self-join relations
  has_many :secondary_projects, class_name: "Repository",
                                foreign_key: "main_project_id"

  belongs_to :main_project, class_name: "Repository", optional: true
end
