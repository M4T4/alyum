# frozen_string_literal: true

class ChangeColumnN1AndN2toIntegers < ActiveRecord::Migration[7.0]
  def up
    change_column :bibliographic_files, :n1, "integer USING NULLIF(n1, '')::int"
    change_column :bibliographic_files, :n2, "integer USING NULLIF(n2, '')::int"
  end
end
