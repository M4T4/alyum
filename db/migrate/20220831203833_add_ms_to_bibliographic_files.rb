class AddMsToBibliographicFiles < ActiveRecord::Migration[7.0]
  def change
    add_column :bibliographic_files, :ms, :boolean
  end
end
