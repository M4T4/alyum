class AddNewBDataToBibliographicFile < ActiveRecord::Migration[7.0]
  def change
    add_column :bibliographic_files, :new_b_data, :boolean
  end
end
