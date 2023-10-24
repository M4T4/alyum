class RemoveAuthorAndYearFromLexicoFile < ActiveRecord::Migration[7.0]
  def change
    remove_column :lexico_files, :year_of_publication
    remove_column :lexico_files, :author
  end
end
