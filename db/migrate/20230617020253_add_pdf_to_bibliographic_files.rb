class AddPdfToBibliographicFiles < ActiveRecord::Migration[7.0]
  def change
    add_column :bibliographic_files, :pdf, :boolean
    add_column :bibliographic_files, :has_access, :boolean
  end
end
