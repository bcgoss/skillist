class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :query
      t.references :location, foreign_key: true
      t.date :last_check
      t.integer :hits
      t.integer :status
      t.timestamps
    end
  end
end
