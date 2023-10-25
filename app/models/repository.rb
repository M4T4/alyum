# frozen_string_literal: true

class Repository < ApplicationRecord
  has_one_attached :image
  enum project_type: [ :main, :secondary ]


  # Self-join relations
  has_many :secondary_projects, class_name: "Repository",
                                foreign_key: "main_project_id"

  belongs_to :main_project, class_name: "Repository", optional: true

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "main_project", "secondary_projects"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date_of_creation", "description", "id", "language", "main_project_id", "project_type", "title", "updated_at"]
  end

end
