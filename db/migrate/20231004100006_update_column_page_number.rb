class UpdateColumnPageNumber < ActiveRecord::Migration[7.0]
  def change
    change_column :bibliographic_files, :page_number, :string
  end
end
