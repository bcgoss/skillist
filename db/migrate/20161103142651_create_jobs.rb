class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :jobkey
      t.string :post_date
      t.string :job_title
      t.string :company
      t.string :snippet
      t.string :url
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
