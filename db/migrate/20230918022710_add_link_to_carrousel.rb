class AddLinkToCarrousel < ActiveRecord::Migration[7.0]
  def change
    add_column :carousels, :link, :string
  end
end
