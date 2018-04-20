class AddFieldsToParsers < ActiveRecord::Migration[5.2]
  def change
    add_column :parsers, :main_url, :string
    add_column :parsers, :record_list_tag, :string
    add_column :parsers, :record_tag, :string
    add_column :parsers, :header_tag, :string
    add_column :parsers, :content_tag, :string
    add_column :parsers, :name, :string
    add_index :parsers, :name, unique: true
    add_column :parsers, :img_tag, :string
    add_column :parsers, :img_attr, :string
  end
end
