class ResetLexicoFiles < ActiveRecord::Migration[7.0]
  def up
    execute "TRUNCATE TABLE lexico_files RESTART IDENTITY CASCADE;"
  end

  def down
    # You might want to handle the down method to restore data or handle rollbacks
  end
end
