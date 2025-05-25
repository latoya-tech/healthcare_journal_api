class CreateJournalEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :journal_entries do |t|
      t.datetime :recorded_at
      t.integer :cpg
      t.text :symptoms
      t.text :activities

      t.timestamps
    end
  end
end
