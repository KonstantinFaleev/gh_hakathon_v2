class CreateSiteEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :site_entries do |t|
      t.string :link
      t.string :header
      t.string :content
      t.string :img
      t.references :site, foreign_key: true

      t.timestamps
    end
    add_index :site_entries, :link, unique: true
  end
end
