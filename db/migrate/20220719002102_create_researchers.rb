class CreateResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :researchers do |t|
      t.string :first_name,         null: false, default: ''
      t.string :last_name,          null: false, default: ''
      t.string :academic_description, null: false, default: ''
      t.string :main_language,       null: false, default: ''
      t.string :main_language_level, null: false, default: ''
      t.string :contact_email,        null: false, default: ''
      t.string :website_link,         null: false, default: ''

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
