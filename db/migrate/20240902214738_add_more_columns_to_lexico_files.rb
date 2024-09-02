class AddMoreColumnsToLexicoFiles < ActiveRecord::Migration[7.0]
  def change
    add_column :lexico_files, :af, :string
    add_column :lexico_files, :structure, :string
    add_column :lexico_files, :original_language, :string
  end
end
