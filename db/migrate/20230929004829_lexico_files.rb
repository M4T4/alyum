class LexicoFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :lexico_files do |t|
      t.string :language
      t.string :word
      t.string :spanish_word
      t.string :english_word
      t.string :author
      t.integer :year_of_publication
      t.string :page
      t.string :alphabet
      t.string :provider
      t.boolean :translated
      t.boolean :audio
      t.references :bibliographic_file, foreign_key: true

      t.timestamps
    end
  end
end
