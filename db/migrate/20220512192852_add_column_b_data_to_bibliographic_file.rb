# frozen_string_literal: true

class AddColumnBDataToBibliographicFile < ActiveRecord::Migration[7.0]
  def change
    add_column :bibliographic_files, :b_data, :string
  end
end
