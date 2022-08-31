class ChangeColumnBibliographicFileMs < ActiveRecord::Migration[7.0]
  def change
    remove_column :bibliographic_files, :ms
  end
end
