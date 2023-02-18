# frozen_string_literal: true

require 'csv'

namespace :custom_task do
  desc 'Populate database'
  task populate_database: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'tabla_bibliografica_2021.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')
    csv.each do |row|
      t = BibliographicFile.new
      t.language_y = row['LENGUA_Y']
      t.language_y2 = row['LENGUA_Y2']
      t.researcher_first_name = row['AUTOR_NOMBRE']
      t.researcher_last_name = row['AUTOR_APELLIDO']
      t.gender = row['SEXO']
      t.year = row["A\xC3\x91O"]
      t.ms = row['MS']
      t.title = row['TITULO']
      t.document_language = row['IDIOMA']
      t.country = row['PAIS']
      t.acces_link = row['ACCESO']
      t.base = row['BASE']
      t.b_data = row['DATOS_B']
      t.n1 = row['N1']
      t.n2 = row['N2']
      t.document_type = 'otro'
      t.save

      # t. 'journal_bookname'
      # t. 'editor_record'
      # t. 'volume'
      # t. 'volume_number'
      # t. 'publisher'
      # t. 'city_country'
      # t. 'isbn'
      # t. 'issn'
      # t. 'doi'
      # t.integer 'document_type'
      # t.boolean 'free_lock'

      # TODO: Agregar condicionales para que se alimenen con los enums
      # t.integer 'n1'
      # t.integer 'n2'
      # t.integer 'page_number'
    end
  end
end
