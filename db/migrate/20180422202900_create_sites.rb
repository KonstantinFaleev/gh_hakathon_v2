class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :main_url
      t.string :entry_list_tag
      t.string :entry_tag
      t.string :header_tag
      t.string :content_tag
      t.string :name
      t.string :img_tag
      t.string :img_attr
      t.timestamps
    end
    add_index :sites, :name, unique: true
  end
end
