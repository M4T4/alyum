class BibliographicFile < ApplicationRecord
	enum document_type: { article: 0, book: 1, chapter: 2, master_thesis: 3, phd_thesis: 4 }
end
