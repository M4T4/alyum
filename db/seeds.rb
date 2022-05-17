# frozen_string_literal: true

# frozen__literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

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

  n1 = case row['N1']
       when 'fonología'
         0
       when 'documentación'
         1
       when 'lexicosemántico'
         2
       when 'sintaxis'
         3
       when 'pragmática discursiva'
         4
       when 'morfología'
         5
       when 'descripción'
         6
       when 'pragmática'
         7
       when 'semantica'
         8
       else
         9
       end

  n2 = case row['N2']
       when 'fonología'
         0
       when 'documentación'
         1
       when 'lexicosemántico'
         2
       when 'sintaxis'
         3
       when 'pragmática discursiva'
         4
       when 'morfología'
         5
       when 'descripción'
         6
       when 'pragmática'
         7
       when 'semantica'
         8
       else
         9
       end

  t.n1 = n1
  t.n2 = n2
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
