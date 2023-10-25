class AddTextToAlphabets < ActiveRecord::Migration[7.0]
  def change
    add_column :alphabets, :text, :string
  end
end
