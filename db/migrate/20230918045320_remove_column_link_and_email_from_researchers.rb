class RemoveColumnLinkAndEmailFromResearchers < ActiveRecord::Migration[7.0]
  def change
    remove_column :researchers, :website_link
    remove_column :researchers, :contact_email
  end
end
