# frozen_string_literal: true

class BibliographicFile < ApplicationRecord
  enum document_type: { article: 0, book: 1, chapter: 2, master_thesis: 3, phd_thesis: 4 }
  enum n1: { fonology: 0, documentation: 1, lexicosemantic: 2, syntax: 3, discursive_pragmatic: 4, morphology: 5, description: 6, pragmatics: 7, semantic: 8, other: 9 },
       _suffix: true
  enum n2: { fonology: 0, documentation: 1, lexicosemantic: 2, syntax: 3, discursive_pragmatic: 4, morphology: 5, description: 6, pragmatics: 7, semantic: 8, other: 9 },
       _suffix: true

end
