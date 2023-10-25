class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :title
      t.string :language
      t.string :description
      t.integer :project_type, default: 0
      
      t.datetime :date_of_creation
      t.references :main_project, foreign_key: { to_table: :repositories }

      t.timestamps
    end
  end
end
