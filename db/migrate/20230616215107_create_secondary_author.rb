class CreateSecondaryAuthor < ActiveRecord::Migration[7.0]
  def change
    create_table :secondary_authors do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :bibliographic_file, foreign_key: true

      t.timestamps
    end
  end
end
