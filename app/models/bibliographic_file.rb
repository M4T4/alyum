# frozen_string_literal: true

class BibliographicFile < ApplicationRecord
  enum document_type: { article: 0, book: 1, chapter: 2, master_thesis: 3, phd_thesis: 4 }
  enum n1: { fonology: 0, documentation: 1 }, _suffix: true
  enum n2: { fonology: 0, documentation: 1 }, _suffix: true
end
