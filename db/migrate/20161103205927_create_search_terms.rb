class CreateSearchTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :search_terms do |t|
      t.references :search, foreign_key: true
      t.references :term, foreign_key: true

      t.timestamps
    end
  end
end
