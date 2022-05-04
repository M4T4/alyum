class CreateBibliographicFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :bibliographic_files do |t|
      t.string :language_y
      t.string :language_y2
      t.string :researcher_first_name
      t.string :researcher_last_name
      t.string :gender
      t.integer :year
      t.string :ms
      t.string :title
      t.string :journal_bookname
      t.string :editor_record
      t.string :volume
      t.string :volume_number
      t.string :publisher
      t.string :city_country
      t.string :isbn
      t.string :issn
      t.string :doi
      t.integer :document_type
      t.string :country
      t.string :acces_link
      t.boolean :free_lock
      t.string :n1
      t.string :n2
      t.integer :page_number
      t.string :base
      
      t.timestamps
    end
  end
end
