class RemoveTermIdFromSearches < ActiveRecord::Migration[5.0]
  def change
    remove_column :searches, :term_id
  end
end
