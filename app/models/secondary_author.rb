# frozen_string_literal: true

class SecondaryAuthor < ApplicationRecord
  belongs_to :bibliographic_file
  validates :first_name, :last_name, presence: true

  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end
