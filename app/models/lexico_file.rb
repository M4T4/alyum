# frozen_string_literal: true

class LexicoFile < ApplicationRecord
	nilify_blanks
	has_paper_trail


	def self.ransackable_attributes(auth_object = nil)
		["alphabet", "audio", "author", "bibliographic_file_id", "created_at", "english_word", 
			"id", "language", "page", "provider", "spanish_word", "translated", "updated_at", 
			"word", "year_of_publication"]
	end


end
