# frozen_string_literal: true

module BibliographicHelper
  def resercher_full_name(file)
    [file.researcher_first_name, file.researcher_last_name].join(' ')
  end

  def languages
    [
      'Cochimi',
      'Cocopa',
      'Diegueño',
      'Havasupai',
      'Hualapai',
      'Kiliwa',
      'Kumeyaay',
      'Kumiay',
      'Maricopa',
      'Mojave',
      'Pa ipai',
      'Tolkapaya',
      'Walapai',
      'Yavapai',
      'Yuma',
      'Yumanas'
    ]
  end

  def language_levels
    %w[n1 n2]
  end

  def n1s
    [
      'Descripción',
      'Documentación',
      'Fonología',
      'Lexicosemántico',
      'Morfología',
      'Pragmática',
      'Pragmática discursiva',
      'Semantica',
      'Sintaxis',
      'n'
    ]
  end

  def document_types
    [
      'Artículo',
      'Libro',
      'Capítulo',
      'Tesis Maestría',
      'Tesis Doctorado'
    ]
  end

  # TODO: Ver si hay una manera mas elegante de hacer esto
end
