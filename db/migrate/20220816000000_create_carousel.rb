class CreateCarousel < ActiveRecord::Migration[7.0]
  def change
    create_table :carousels do |t|
      t.integer :position
      t.boolean :visible
      t.timestamps
    end
  end
end
