class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :keyword
      t.date :last_check

      t.timestamps
    end
  end
end
