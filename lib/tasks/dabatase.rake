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
    end
  end

  desc 'Populate lexic test files'
  task populate_lexic_test: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'tabla_lexica_prueba_2.csv'))
    # Esto es lo que se tiene que hacer en caso de generar el csv por medio de excel
    csv = CSV.parse(csv_text, headers: true, encoding: 'iso-8859-1:utf-8')
    csv.each do |row|
      t = LexicoFile.new
      t.language = row['language']
      t.word = row['word']
      t.spanish_word = row['spanish_word']
      t.english_word = row['english_word']
      t.author = row['author']
      t.year_of_publication = row['year_of_publication']
      t.page = row['page']
      t.alphabet = row['alphabet']
      t.provider = row['provider']
      if row['translated'] == 'Y' 
        t.translated = 1
      else
        t.translated = 0
      end

      if row['audio'] == 'Y'
        t.audio = 1
      else
        t.audio = 0
      end

      date_obj = Date.strptime(row['Fecha'],'%d/%m/%Y')
      t.created_at = date_obj
      t.save
    end
  end
end
