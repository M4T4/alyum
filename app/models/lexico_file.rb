# frozen_string_literal: true

class LexicoFile < ApplicationRecord
	require 'csv'
	nilify_blanks
	has_paper_trail

	has_one_attached :audio_file, service: :local
	
	belongs_to :alphabet, optional: true
	belongs_to :bibliographic_file, optional: true

	delegate :researcher_first_name, :researcher_last_name, :year, to: :bibliographic_file, allow_nil: true


	def self.ransackable_attributes(auth_object = nil)
		["alphabet", "audio", "author", "bibliographic_file_id", "created_at", "english_word", 
			"id", "language", "page", "provider", "spanish_word", "translated", "updated_at", 
			"word", "year_of_publication"]
	end

	def self.ransackable_associations(auth_object = nil)
    ["versions"]
  end

	def self.to_csv
		lexico_files = all
		CSV.generate do |csv|
			csv << column_names
			lexico_files.each do |lf|
				csv << lf.attributes.values_at(*column_names)
			end
		end
	end

end
