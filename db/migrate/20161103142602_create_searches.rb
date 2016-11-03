class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.references :term, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :hits
      t.string :status

      t.timestamps
    end
  end
end
