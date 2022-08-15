class UpdateColumnFreeLock < ActiveRecord::Migration[7.0]
  def change
    change_column(:bibliographic_files, :free_lock, :boolean, default: false)
  end
end
