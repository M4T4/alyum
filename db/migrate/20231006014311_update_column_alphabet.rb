class UpdateColumnAlphabet < ActiveRecord::Migration[7.0]
  def change
    remove_column :lexico_files, :alphabet, :string
    add_reference :lexico_files, :alphabet, index: true
  end
end
