class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :jobkey
      t.date :post_date
      t.string :company
      t.references :location, foreign_key: true
      t.string :snippet
      t.string :url
      t.timestamps
    end
  end
end
