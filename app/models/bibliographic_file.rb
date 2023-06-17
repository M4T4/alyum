# frozen_string_literal: true

class BibliographicFile < ApplicationRecord
	nilify_blanks
	has_paper_trail

  has_many :secondary_authors
end
