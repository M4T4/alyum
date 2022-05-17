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
end
