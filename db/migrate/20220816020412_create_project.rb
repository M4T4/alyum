class CreateProject < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false, default: ''
      t.string :body,  null: false, default: ''

      t.timestamps
    end
  end
end
