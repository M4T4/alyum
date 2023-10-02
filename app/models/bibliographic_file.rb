# frozen_string_literal: true

class BibliographicFile < ApplicationRecord
	nilify_blanks
	has_paper_trail

  has_many :secondary_authors

	def self.ransackable_attributes(auth_object = nil)
    ["acces_link", "b_data", "base", "city_country", "country", "created_at", "document_language", 
			"document_type", "doi", "editor_record", "free_lock", "gender", "has_access", "id", "isbn", 
			"issn", "journal_bookname", "language_y", "language_y2", "ms", "n1", "n2", "page_number", 
			"pdf", "publisher", "researcher_first_name", "researcher_last_name", "title", "updated_at", 
			"volume", "volume_number", "year"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["secondary_authors", "versions"]
  end

	def page
		if self.page_number.blank?
			''
		else
			["pp. #{self.page_number}"]
		end
	end

	def data
		[self.journal_bookname, self.publisher, self.city_country, self.volume, self.volume_number, self.page].reject(&:blank?).join(', ')
	end
end
