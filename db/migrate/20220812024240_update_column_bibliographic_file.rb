class UpdateColumnBibliographicFile < ActiveRecord::Migration[7.0]
  def change
    change_column(:bibliographic_files, :document_type, :string)
  end
end
